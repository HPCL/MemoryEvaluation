#ifndef MIRASEMANTICS_H
#define MIRASEMANTICS_H

#include "ConcreteSemantics2.h"
#include <iostream>

// "using namespace" in headers is probably not wise, but it is expedient for now
using namespace std;
using namespace Rose::BinaryAnalysis;
using namespace Rose::BinaryAnalysis::InstructionSemantics2;

	// derive SValue may not be necessary at this time
	typedef Sawyer::SharedPointer<class MiraSValue> MiraSValuePtr;

	class MiraSValue : public ConcreteSemantics::SValue {
	protected:
		explicit MiraSValue(size_t nbits) : ConcreteSemantics::SValue(nbits) {}
		
		MiraSValue(size_t nbits, uint64_t number) : ConcreteSemantics::SValue(nbits, number) {}
		
	public:
		static MiraSValuePtr instance() {
			return MiraSValuePtr(new MiraSValue(1));
		}

		static MiraSValuePtr instance(size_t nbits) {
			return MiraSValuePtr(new MiraSValue(nbits));
		}

		static MiraSValuePtr instance(size_t nbits, uint64_t value) {
			return MiraSValuePtr(new MiraSValue(nbits, value));
		}

		// virtual allocating constructor
	public:
		virtual BaseSemantics::SValuePtr undefined_(size_t nbits) const ROSE_OVERRIDE {
			return instance(nbits); 
		}

		virtual BaseSemantics::SValuePtr unspecified_(size_t nbits) const ROSE_OVERRIDE {
			return instance(nbits);
		}

		virtual BaseSemantics::SValuePtr bottom_(size_t nbits) const ROSE_OVERRIDE {
			return instance(nbits);
		}

		virtual BaseSemantics::SValuePtr number_(size_t nbits, uint64_t value) const ROSE_OVERRIDE {
			return instance(nbits, value);
		}

		virtual BaseSemantics::SValuePtr boolean_(bool value) const ROSE_OVERRIDE {
			return instance(1, value ? 1 : 0);
		}

		virtual BaseSemantics::SValuePtr copy(size_t new_width=0) const ROSE_OVERRIDE {
                    BaseSemantics::SValuePtr retval(new MiraSValue(*this));
			if (new_width!=0 && new_width!=retval->get_width())
				retval->set_width(new_width);
			return retval; 
		}

		virtual Sawyer::Optional<BaseSemantics::SValuePtr> createOptionalMerge(const BaseSemantics::SValuePtr &other, 
				const BaseSemantics::MergerPtr&, SMTSolver*) const ROSE_OVERRIDE {
			throw BaseSemantics::NotImplemented("SValue merging for MiraSemantics is not supported", NULL);
		}

	public:
		// dynamic cast
		static MiraSValuePtr promote(const BaseSemantics::SValuePtr &v) {
			MiraSValuePtr retval = v.dynamicCast<MiraSValue>();
			ASSERT_not_null(retval);
			return retval;
		}
	};
	
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
			BaseSemantics::SValuePtr protoval = MiraSValue::instance();
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
	
		virtual void writeMemory(const RegisterDescriptor &segreg, const BaseSemantics::SValuePtr &address,
								 const BaseSemantics::SValuePtr &value_, const BaseSemantics::SValuePtr &cond) ROSE_OVERRIDE;

		virtual BaseSemantics::SValuePtr readMemory(const RegisterDescriptor &segreg, const BaseSemantics::SValuePtr &address,
													const BaseSemantics::SValuePtr &value_, const BaseSemantics::SValuePtr &cond) ROSE_OVERRIDE;

	}; // end class MiraRiscOperators

#endif
