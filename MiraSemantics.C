#include "rose.h"
#include "MiraSemantics.h"

using namespace std;

namespace rose {
namespace BinaryAnalysis {
namespace InstructionSemantics2 {
namespace ConcreteSemantics {
	
	
void 
MiraRiscOperators::writeMemory1(const RegisterDescriptor &segreg, const BaseSemantics::SValuePtr &address,
								const BaseSemantics::SValuePtr &value_, const BaseSemantics::SValuePtr &cond)
{
	ConcreteSemantics::RiscOperators::writeMemory(segreg, address, value_, cond);
	//cout <<"hello"<<endl;
}


BaseSemantics::SValuePtr
MiraRiscOperators::readMemory1(const RegisterDescriptor &segreg, const BaseSemantics::SValuePtr &address,
								const BaseSemantics::SValuePtr &value_, const BaseSemantics::SValuePtr &cond)
{
	ConcreteSemantics::RiscOperators::readMemory(segreg, address, value_, cond);
	//cout <<"world"<<endl;
}


} // end namespace ConcreteSemantics
} // end namespace InstructionSemantics2	
} // end namespace BinaryAnalysis
} // end namespace rose



