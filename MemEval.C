#include "rose.h"
#include "DwarfLineMapper.h"
#include "Partitioner2/Engine.h"
#include "AsmUnparser.h"
#include <boost/units/detail/utility.hpp>
#include <iostream>
#include <string>
#include "DispatcherX86.h"
#include "MiraSemantics.h"

using namespace std;
using namespace rose;
using namespace rose::BinaryAnalysis::InstructionSemantics2;
typedef boost::unordered_map<int, std::vector<SgAsmInstruction*> > instrMap;


int main(int argc, char** argv)
{
	/*
	* commandline format
	* app binary_path source_path
	*/

	// check command
	if (argc != 3)
	{
		cout << "invalid command" << endl;
		exit(EXIT_FAILURE);
	}	

	// generate binary project
	vector<string> binInput;
	binInput.push_back(string(argv[0]));
	binInput.push_back(string(argv[1]));
	SgProject* binProj = new SgProject(binInput);
	
	// generate source project
	vector<string> srcInput;
	srcInput.push_back(string(argv[0]));
	srcInput.push_back(string(argv[2]));
	SgProject* srcProj = new SgProject(srcInput);
	
	// get DWARF mapping
	BinaryAnalysis::DwarfLineMapper lineMap = BinaryAnalysis::DwarfLineMapper(binProj);
	// adjust mapping distance
	lineMap.fix_holes(1000);
	vector<SgAsmFunction*> asmFunction = SageInterface::querySubTree<SgAsmFunction>(binProj);
	if (asmFunction.empty())
	{
		cout << "no binary interpretations found" << endl;
		exit(EXIT_FAILURE);
	}	
	
	// vector of vector for storing instructions of each loop
	vector< vector<SgAsmInstruction*> > loopVec;
    // map to store loop info
	boost::unordered_map<int, std::pair<int, int> > loopMap;
	// process source code
	// locate loops in source 
	vector<SgForStatement*> forStatVec = SageInterface::querySubTree<SgForStatement>(srcProj);
	for (vector<SgForStatement*>::iterator it = forStatVec.begin(); it != forStatVec.end(); it++) 
	{
		SgForStatement* forStat = (*it);
		// get line number for the loop head
		int loopHead = forStat -> get_file_info() -> get_line();
		SgStatement* body = forStat -> get_loop_body();
		// get line numbers for the first/last statement inside loop
		SgStatement* first = SageInterface::getFirstStatement((SgScopeStatement*)body);
		SgStatement* last  = SageInterface::getLastStatement((SgScopeStatement*)body);
		int firstLine = first -> get_file_info() -> get_line();
		int lastLine  = last -> get_file_info() -> get_line();
		loopMap.insert(make_pair(loopHead, make_pair(firstLine, lastLine)));
	}

#if 0
	// test loopMap
	for (boost::unordered_map<int, std::pair<int,int> >::iterator mit = loopMap.begin(); mit != loopMap.end(); mit++)
	{
		cout << "map head: " << mit -> first << "map first: " << (mit -> second).first << "map last: " << (mit -> second) .second << endl;
	}	
#endif
	
	instrMap* im = new instrMap();
	int firstLine = -1;
	int lastLine = -1;
	// use map to indicate whether this loop head is processed
	boost::unordered_map<int, int> loopFlag;
	for (vector<SgAsmFunction*>::iterator it = asmFunction.begin(); it != asmFunction.end(); it++)
	{
		string funcName = (*it) -> get_name();
		string demangleName = boost::units::detail::demangle(funcName.c_str());
		if (demangleName != "demangle :: error - unable to demangle specified symbol" || funcName == "main") 
		{
			BinaryAnalysis::DwarfLineMapper ln = BinaryAnalysis::DwarfLineMapper(*it);
			// retrieve instructions from asm statements
			vector<SgAsmInstruction*> asmInstr = SageInterface::querySubTree<SgAsmInstruction>(*it);
			// store instructions by line number
			for (vector<SgAsmInstruction*>::iterator ins = asmInstr.begin(); ins != asmInstr.end(); ins++)
			{
				BinaryAnalysis::DwarfLineMapper::SrcInfo srcInfo = lineMap.addr2src((*ins) -> get_address());
				int lineNum = srcInfo.line_num;
				// check if line number already exists in the map
				if (im -> find(lineNum) == im -> end())
				{
					// line number doesn't exist
					vector<SgAsmInstruction*> inV;
					inV.push_back(*ins);
					im -> insert(make_pair(lineNum, inV));
				}else {

					// line number doesn't exit				
					(im -> find(lineNum) -> second).push_back(*ins);
				}
#if 0			
				// test
				cout<<"Instruction " << ((SgAsmX86Instruction*)(*ins)) -> get_kind()<< " base size "<<((SgAsmX86Instruction*)(*ins)) -> get_size() << " operand size "<<((SgAsmX86Instruction*)(*ins)) -> get_operandSize()<< " " << (*ins)->get_mnemonic()<<" line "<< lineMap.addr2src((*ins)->get_address()).line_num <<" size "<< (*ins) -> get_size()<<endl;	
#endif 			
				// find instructions belong to loops
				if(loopMap.find(lineNum) != loopMap.end())
				{
					// find loop head 
					if (loopFlag.find(lineNum) == loopFlag.end())
					{
						// first time to process this loop head line
						// loop head initialization
						firstLine = loopMap[lineNum].first;
						lastLine  = loopMap[lineNum].second;
						vector<SgAsmInstruction*> inst;
						inst.push_back(*ins);
						loopVec.push_back(inst);
						// update loopFlag
						loopFlag.insert(make_pair(lineNum, 1));
					}else{
						// loop head comparision
						// after loop body
						loopVec.back().push_back(*ins);
					}
				}

				if(lineNum >= firstLine && lineNum <= lastLine)
				{
					loopVec.back().push_back(*ins);
				}
	
			}	
		}
	}

	/*
	for(vector<SgForStatement*>::iterator it = forStatVec.begin(); it != forStatVec.end(); it++) {
		SgForStatement* forStat = *it;
		// get for loop body
		SgStatement* body = forStat -> get_loop_body();
		// query each statement from the loop tree
		vector<SgStatement*> statVec = SageInterface::querySubTree<SgStatement>(body);	
		SgStatement* first = SageInterface::getFirstStatement((SgScopeStatement*)body);
		SgAsmInstruction* firstInBody = (im -> find(first->get_file_info()->get_line()) -> second)[0];
		SgAsmBlock* asmBlk = SageInterface::getEnclosingNode<SgAsmBlock>(firstInBody);
		SgAsmBlock* allLoop = SageInterface::getEnclosingNode<SgAsmBlock>(asmBlk);
		vector<SgAsmBlock*> allBlk = SageInterface::querySubTree<SgAsmBlock>(allLoop);
		int idx = findIndex(allBlk, asmBlk);
		if (idx > 0)
		{
			vector<SgAsmInstruction*> loopInit = SageInterface::querySubTree<SgAsmInstruction>(allBlk[idx-1]);
			vector<SgAsmInstruction*> loopBody = SageInterface::querySubTree<SgAsmInstruction>(asmBlk);
			vector<SgAsmInstruction*> loopComp = SageInterface::querySubTree<SgAsmInstruction>(allBlk[idx+1]);
			instrVec.reserve(loopInit.size()+loopBody.size()+loopComp.size());
			instrVec.insert(instrVec.end(), loopInit.begin(), loopInit.end());		
			instrVec.insert(instrVec.end(), loopBody.begin(), loopBody.end());		
			instrVec.insert(instrVec.end(), loopComp.begin(), loopComp.end());		
		}		
	} 
	*/
	
	const RegisterDictionary* regdict = RegisterDictionary::dictionary_amd64();
	ConcreteSemantics::MiraRiscOperatorsPtr operators = ConcreteSemantics::MiraRiscOperators::instance(regdict);
	BaseSemantics::DispatcherPtr dispatcher = DispatcherX86::instance(operators, 32);
	// test
	
	for(vector< vector<SgAsmInstruction*> >::iterator it = loopVec.begin(); it != loopVec.end(); it++) {
		vector<SgAsmInstruction*> instrVec = (*it);
		for (vector<SgAsmInstruction*>::iterator iit = instrVec.begin(); iit != instrVec.end(); iit++)
		{
			//cout << "instruction: "<< (*iit) -> get_mnemonic() << endl; 	
			dispatcher -> processInstruction(*iit);
		}
		cout << "---------------------------------------------------" << endl;
	}
		

	delete im;
}
