#ifndef MIRASEMANTICS_H
#define MIRASEMANTICS_H

#include "ConcreteSemantics2.h"
#include <iostream>

using namespace std;

namespace rose {
namespace BinaryAnalysis {
namespace InstructionSemantics2 {
namespace ConcreteSemantics {
	
	// smart pointer 
	typedef boost::shared_ptr<class MiraMemoryState> MiraMemoryStatePtr;		
	
	// MiraMemoryState inherit from ConcreteSemantics::MemoryState
	class MiraMemoryState: public ConcreteSemantics::MemoryState {
	protected:
		MiraMemoryState(const MiraMemoryState &other)
			: ConcreteSemantics::MemoryState(other) {}

		explicit MiraMemoryState(const BaseSemantics::SValuePtr &addrProtoval, const BaseSemantics::SValuePtr &valProtoval)
			: ConcreteSemantics::MemoryState(addrProtoval, valProtoval) {}
	
	// static allocating constructors
	public:
		static MiraMemoryStatePtr instance(const MiraMemoryStatePtr &other) {
			return MiraMemoryStatePtr(new MiraMemoryState(*other));
		}
	
		static MiraMemoryStatePtr instance(const BaseSemantics::SValuePtr &addr, const BaseSemantics::SValuePtr &val) {
			return MiraMemoryStatePtr(new MiraMemoryState(addr, val));
		}

	// virtual constructors
	public:
		virtual BaseSemantics::MemoryStatePtr clone() const ROSE_OVERRIDE {
			return MiraMemoryStatePtr(new MiraMemoryState(*this));
		}

		virtual BaseSemantics::MemoryStatePtr create(const BaseSemantics::SValuePtr &addr, const BaseSemantics::SValuePtr &val) const ROSE_OVERRIDE {
			return instance(addr, val);
		}
	
	// check dynamic casts
	public:
		static MiraMemoryStatePtr promote(const BaseSemantics::MemoryStatePtr &x) {
			MiraMemoryStatePtr retval = boost::dynamic_pointer_cast<MiraMemoryState>(x);
			assert(retval!=NULL);
			return retval;
		}
		

	}; // end class MiraMemoryState


	// MiraRiscOperators 
	typedef boost::shared_ptr<class MiraRiscOperators> MiraRiscOperatorsPtr;

	class MiraRiscOperators : public ConcreteSemantics::RiscOperators {
	protected:
		MiraRiscOperators(const BaseSemantics::SValuePtr &protoval, SMTSolver *solver)
			: ConcreteSemantics::RiscOperators(protoval, solver) {}

		MiraRiscOperators(const BaseSemantics::StatePtr &state, SMTSolver *solver)
			: ConcreteSemantics::RiscOperators(state, solver) {}

	// static allocating constructor
	public:
		static MiraRiscOperatorsPtr instance(const RegisterDictionary *regdict, SMTSolver *solver=NULL) {
			BaseSemantics::SValuePtr protoval = ConcreteSemantics::SValue::instance();
			BaseSemantics::RegisterStatePtr registers = BaseSemantics::RegisterStateGeneric::instance(protoval, regdict);
			BaseSemantics::MemoryStatePtr memory = MiraMemoryState::instance(protoval, protoval);
			BaseSemantics::StatePtr state = BaseSemantics::State::instance(registers, memory);
			return MiraRiscOperatorsPtr(new MiraRiscOperators(state, solver));
		}

		static MiraRiscOperatorsPtr instance(const BaseSemantics::SValuePtr &protoval, SMTSolver *solver=NULL) {
			return MiraRiscOperatorsPtr(new MiraRiscOperators(protoval, solver));
		}

		static MiraRiscOperatorsPtr instance(const BaseSemantics::StatePtr &state, SMTSolver *solver=NULL) {
			return MiraRiscOperatorsPtr(new MiraRiscOperators(state, solver));
		}
	
	// virtual constructor
	public:
		virtual BaseSemantics::RiscOperatorsPtr create(const BaseSemantics::SValuePtr &protoval, SMTSolver *solver=NULL) const ROSE_OVERRIDE {
			return instance(protoval, solver);
		}

		virtual BaseSemantics::RiscOperatorsPtr create(const BaseSemantics::StatePtr &state, SMTSolver *solver=NULL) const ROSE_OVERRIDE {
			return instance(state, solver);
		}

	// check dynamic casts
	public:
		static MiraRiscOperatorsPtr promote(const BaseSemantics::RiscOperatorsPtr &x) {
			MiraRiscOperatorsPtr retval = boost::dynamic_pointer_cast<MiraRiscOperators>(x);
			assert(retval!=NULL);
			return retval;
		}
	
		virtual void writeMemory1(const RegisterDescriptor &segreg, const BaseSemantics::SValuePtr &address,
								 const BaseSemantics::SValuePtr &value_, const BaseSemantics::SValuePtr &cond) ROSE_OVERRIDE;

		virtual BaseSemantics::SValuePtr readMemory1(const RegisterDescriptor &segreg, const BaseSemantics::SValuePtr &address,
													const BaseSemantics::SValuePtr &value_, const BaseSemantics::SValuePtr &cond) ROSE_OVERRIDE;

	}; // end class MiraRiscOperators

} // end namespace ConcreteSemantics
} //end namespace InstructionSemantics2	
} //end namespace BinaryAnalysis
}



#endif
