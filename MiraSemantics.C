#include "rose.h"
#include "MiraSemantics.h"

using namespace std;
using namespace Rose::BinaryAnalysis::InstructionSemantics2;
	
	
void 
MiraRiscOperators::writeMemory(const RegisterDescriptor &segreg, const BaseSemantics::SValuePtr &address,
								const BaseSemantics::SValuePtr &value_, const BaseSemantics::SValuePtr &cond)
{
	ConcreteSemantics::RiscOperators::writeMemory(segreg, address, value_, cond);
  
}


BaseSemantics::SValuePtr
MiraRiscOperators::readMemory(const RegisterDescriptor &segreg, const BaseSemantics::SValuePtr &address,
								const BaseSemantics::SValuePtr &value_, const BaseSemantics::SValuePtr &cond)
{
	return ConcreteSemantics::RiscOperators::readMemory(segreg, address, value_, cond);
}
