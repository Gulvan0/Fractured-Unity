// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_Model
#define INCLUDED_battle_Model

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_battle_ISimpleModel
#include <battle/ISimpleModel.h>
#endif
#ifndef INCLUDED_battle_IMutableModel
#include <battle/IMutableModel.h>
#endif
#ifndef INCLUDED_battle_IObservableModel
#include <battle/IObservableModel.h>
#endif
HX_DECLARE_CLASS0(Element)
HX_DECLARE_CLASS0(ID)
HX_DECLARE_CLASS1(battle,Ability)
HX_DECLARE_CLASS1(battle,Active)
HX_DECLARE_CLASS1(battle,ChooseResult)
HX_DECLARE_CLASS1(battle,IModelObserver)
HX_DECLARE_CLASS1(battle,IMutableModel)
HX_DECLARE_CLASS1(battle,IObservableModel)
HX_DECLARE_CLASS1(battle,ISimpleModel)
HX_DECLARE_CLASS1(battle,Model)
HX_DECLARE_CLASS1(battle,TargetResult)
HX_DECLARE_CLASS1(battle,Unit)
HX_DECLARE_CLASS2(battle,enums,InputMode)
HX_DECLARE_CLASS2(battle,enums,Source)
HX_DECLARE_CLASS2(battle,enums,Team)
HX_DECLARE_CLASS2(battle,_hx_struct,UPair)
HX_DECLARE_CLASS2(battle,_hx_struct,UnitCoords)

namespace battle{


class HXCPP_CLASS_ATTRIBUTES Model_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef Model_obj OBJ_;
		Model_obj();

	public:
		enum { _hx_ClassId = 0x05fd5cc9 };

		void __construct(::Array< ::Dynamic> allies,::Array< ::Dynamic> enemies);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="battle.Model")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"battle.Model"); }
		static hx::ObjectPtr< Model_obj > __new(::Array< ::Dynamic> allies,::Array< ::Dynamic> enemies);
		static hx::ObjectPtr< Model_obj > __alloc(hx::Ctx *_hx_ctx,::Array< ::Dynamic> allies,::Array< ::Dynamic> enemies);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Model_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_HCSTRING("Model","\x89","\x93","\x85","\x9f"); }

		::Array< ::Dynamic> observers;
		 ::battle::_hx_struct::UPair units;
		 ::battle::enums::InputMode inputMode;
		int chosenAbilityPos;
		 ::battle::_hx_struct::UnitCoords UAtarget;
		 ::battle::_hx_struct::UnitCoords UAcaster;
		 ::battle::Active UAability;
		int UAiterator;
		int AOECounter;
		int responsesLeft;
		 ::Dynamic continuePoint;
		::cpp::VirtualArray continueArgs;
		::Array< ::Dynamic> readyUnits;
		 ::battle::_hx_struct::UPair getUnits();
		::Dynamic getUnits_dyn();

		 ::battle::enums::InputMode getInputMode();
		::Dynamic getInputMode_dyn();

		void changeHP( ::battle::_hx_struct::UnitCoords targetCoords, ::battle::_hx_struct::UnitCoords casterCoords,int dhp, ::Element element, ::battle::enums::Source source);
		::Dynamic changeHP_dyn();

		void changeMana( ::battle::_hx_struct::UnitCoords targetCoords, ::battle::_hx_struct::UnitCoords casterCoords,int dmana, ::battle::enums::Source source);
		::Dynamic changeMana_dyn();

		void changeAlacrity( ::battle::_hx_struct::UnitCoords targetCoords, ::battle::_hx_struct::UnitCoords casterCoords,Float dalac, ::battle::enums::Source source);
		::Dynamic changeAlacrity_dyn();

		void castBuff( ::ID id, ::battle::_hx_struct::UnitCoords targetCoords, ::battle::_hx_struct::UnitCoords casterCoords,int duration);
		::Dynamic castBuff_dyn();

		void dispellBuffs( ::battle::_hx_struct::UnitCoords targetCoords,::Array< ::Dynamic> elements, ::Dynamic count);
		::Dynamic dispellBuffs_dyn();

		void choose(int abilityPos);
		::Dynamic choose_dyn();

		void targetAndUse( ::battle::_hx_struct::UnitCoords targetCoords);
		::Dynamic targetAndUse_dyn();

		void useAbility();
		::Dynamic useAbility_dyn();

		void setUA( ::battle::_hx_struct::UnitCoords target, ::battle::_hx_struct::UnitCoords caster, ::battle::Active ability);
		::Dynamic setUA_dyn();

		void clearUA();
		::Dynamic clearUA_dyn();

		void alacrityIncrement();
		::Dynamic alacrityIncrement_dyn();

		void processReady();
		::Dynamic processReady_dyn();

		void postTurnProcess( ::battle::_hx_struct::UnitCoords coords);
		::Dynamic postTurnProcess_dyn();

		void botMakeTurn( ::battle::Unit bot);
		::Dynamic botMakeTurn_dyn();

		Float getAlacrityGain( ::battle::Unit unit);
		::Dynamic getAlacrityGain_dyn();

		void sortByFlow(::Array< ::Dynamic> array);
		::Dynamic sortByFlow_dyn();

		void end( ::battle::enums::Team winner);
		::Dynamic end_dyn();

		 ::battle::enums::Team defineWinner();
		::Dynamic defineWinner_dyn();

		bool checkAlive(::Array< ::Dynamic> array);
		::Dynamic checkAlive_dyn();

		bool bothTeamsAlive();
		::Dynamic bothTeamsAlive_dyn();

		void skipTurn();
		::Dynamic skipTurn_dyn();

		void quit();
		::Dynamic quit_dyn();

		void printAbilityInfo(int num);
		::Dynamic printAbilityInfo_dyn();

		void printUnitInfo( ::battle::_hx_struct::UnitCoords coords);
		::Dynamic printUnitInfo_dyn();

		void addObserver(::Dynamic obs);
		::Dynamic addObserver_dyn();

		void respond();
		::Dynamic respond_dyn();

		 ::battle::ChooseResult checkChoose(int abilityPos);
		::Dynamic checkChoose_dyn();

		 ::battle::TargetResult checkTarget( ::battle::_hx_struct::UnitCoords targetCoords,int abilityPos);
		::Dynamic checkTarget_dyn();

		bool targetAvaibility( ::battle::_hx_struct::UnitCoords unit);
		::Dynamic targetAvaibility_dyn();

		void init();
		::Dynamic init_dyn();

};

} // end namespace battle

#endif /* INCLUDED_battle_Model */ 
