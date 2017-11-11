const char *purpose = "demo";
const char *description = "Not written yet.";

#include <rose.h>                                       // must be first ROSE include
#include <AsmUnparser_compat.h>
#include <MiraSemantics.h>
#include <Partitioner2/Engine.h>
#include <Partitioner2/Partitioner.h>
#include <Partitioner2/BasicBlock.h>
#include <Partitioner2/Utility.h>
#include <Sawyer/CommandLine.h>
#include <Sawyer/Message.h>

using namespace Rose;
using namespace Sawyer::Message::Common;
namespace P2 = Rose::BinaryAnalysis::Partitioner2;
namespace S2 = Rose::BinaryAnalysis::InstructionSemantics2;

Sawyer::Message::Facility mlog;
AddressIntervalSet insnAddrsInLoop;

// Parse command-line switches and return positional args.  I'm adding a new switch called "--loop" in order for the user to
// specify the virtual addresses for the loop instructions because I was unable to get libdwarf to compile cleanly on my
// machine (and therefore DwarfLineMapper is useless to me).
std::vector<std::string>
parseCommandLine(int argc, char *argv[], P2::Engine &engine) {
    using namespace Sawyer::CommandLine;

    SwitchGroup tool("Tool-specific switches");
    std::vector<AddressInterval> intervals;
    tool.insert(Switch("loop")
                .argument("interval", P2::addressIntervalParser(intervals))
                .whichValue(SAVE_ALL)
                .doc("Addresses that are part of the loop to process. This switch may appear more than once in order to "
                     "create a union of addresses. " + P2::AddressIntervalParser::docString()));
    
    Parser p = engine.commandLineParser(purpose, description);
    p.with(tool);
    std::vector<std::string> positionalArgs = p.parse(argc, argv).apply().unreachedArgs();

    BOOST_FOREACH (const AddressInterval &interval, intervals)
        insnAddrsInLoop.insert(interval);
    if (insnAddrsInLoop.isEmpty()) {
        ::mlog[FATAL] <<"you must specify loop instruction addresses with --loop; see --help\n";
        exit(1);
    }

    return positionalArgs;
}

int
main(int argc, char *argv[]) {
    ROSE_INITIALIZE;
    Diagnostics::initAndRegister(&::mlog, "tool");
    P2::Engine engine;
    std::vector<std::string> specimenName = parseCommandLine(argc, argv, engine);
    P2::Partitioner partitioner = engine.partition(specimenName);

#if 0 // [Robb Matzke 2017-11-11]: I couldn't get libdwarf to compile on my machine, so this won't work
    // DwarfLineMapper needs the AST for the ELF container, but not instructions.
    SgAsmInterpretation *interp = engine.interpretation();
    if (!interp) {
        mlog[FATAL] <<"this binary does not live in an ELF or PE container\n";
        exit(1);
    }
    ASSERT_require(!interp->get_headers()->get_headers().size().empty());
    DwarfLineMapper lineMapper(interp->get_headers()->get_headers()[0]);
    lineMapper.print_src2addr(std::cout);
#endif

    // Find the first basic block for the loop.  Most of my analyses operate in terms of basic blocks because it makes them
    // more efficient. A basic block can be thought of as just a large instruction.  I'll assume that the lowest address from
    // the command-line is the start of the loop and that a basic block exists at that address.
    P2::BasicBlock::Ptr bblock = partitioner.basicBlockExists(insnAddrsInLoop.least());
    ASSERT_not_null2(bblock, "no basic block at your starting address");

    // Build the machine state for this loop.  Notice there's no machine-specific stuff here anymore.
    const RegisterDictionary* regdict = partitioner.instructionProvider().registerDictionary();
    S2::BaseSemantics::RiscOperatorsPtr operators = MiraRiscOperators::instance(regdict);
    S2::BaseSemantics::DispatcherPtr dispatcher = partitioner.newDispatcher(operators);

    // Now "execute" each basic block by executing it's instructions in order. At the end of the basic block we need to decide
    // which block to execute next.
    while (bblock != NULL) {
        BOOST_FOREACH (SgAsmInstruction *insn, bblock->instructions()) {
            // You'll almost certainly want to catch some exceptions here.
            SAWYER_MESG(::mlog[DEBUG]) <<"processing instruction " <<unparseInstructionWithAddress(insn) <<"\n";
            dispatcher->processInstruction(insn);
            SAWYER_MESG(::mlog[DEBUG]) <<"machine state after instruction:\n" <<*operators;
        }

        // Which block is next? This is where you get imaginative. ;-) Here's a few possibilities.
        rose_addr_t nextVa = 0;

        if (true) {
            // Try looking at the machine state to get the next address.
            const RegisterDescriptor ip = partitioner.instructionProvider().instructionPointerRegister();
            S2::ConcreteSemantics::SValuePtr ipVal = S2::ConcreteSemantics::SValue::promote(operators->readRegister(ip));
            nextVa = ipVal->get_number();
        } else if (true) {
            // Choose the next basic block based on the global CFG.
            P2::ControlFlowGraph::ConstVertexIterator curCfgVert = partitioner.findPlaceholder(bblock->address());
            BOOST_FOREACH (const P2::ControlFlowGraph::Edge &edge, curCfgVert->outEdges()) {
                P2::ControlFlowGraph::ConstVertexIterator nextCfgVert = edge.target();
                if (nextCfgVert->value().type() == P2::V_BASIC_BLOCK) {
                    nextVa = nextCfgVert->value().address();
                    break;                              // arbitrarily choosing first basic block edge
                }
            }
        } else {
            // Choose the basic block with the lowest first instruction address such that it's past the instruction we just
            // processed.  A simple but slow way is to just iterate over all the basic blocks. (Actually, it's not any slower
            // than how you were calling querySubTree in your own code.)
            P2::BasicBlock::Ptr bestNextBlock;
            BOOST_FOREACH (const P2::BasicBlock::Ptr &candidate, partitioner.basicBlocks()) {
                if (candidate->address() > bblock->address() &&
                    (bestNextBlock == NULL || candidate->address() < bestNextBlock->address())) {
                    bestNextBlock = candidate;
                }
            }
            ASSERT_not_null2(bestNextBlock, "no next block");
            nextVa = bestNextBlock->address();
        }
        
        // I'm running out of time.  You have an address of a potential next basic block. You'll need to decide whether that's
        // really the block you want to process. In any case, here's how you get the block (if it exists).
        bblock = partitioner.basicBlockExists(nextVa);
        ASSERT_not_null(bblock);
    }
}
