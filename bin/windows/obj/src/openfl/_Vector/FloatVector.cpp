// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_openfl__Vector_FloatVector
#include <openfl/_Vector/FloatVector.h>
#endif
#ifndef INCLUDED_openfl__Vector_IVector
#include <openfl/_Vector/IVector.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_055b1e986ae1a23a_633_new,"openfl._Vector.FloatVector","new",0x7ccdf307,"openfl._Vector.FloatVector.new","openfl/Vector.hx",633,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_660_concat,"openfl._Vector.FloatVector","concat",0xbb39c8cd,"openfl._Vector.FloatVector.concat","openfl/Vector.hx",660,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_685_copy,"openfl._Vector.FloatVector","copy",0xb028eb2e,"openfl._Vector.FloatVector.copy","openfl/Vector.hx",685,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_692_get,"openfl._Vector.FloatVector","get",0x7cc8a33d,"openfl._Vector.FloatVector.get","openfl/Vector.hx",692,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_697_indexOf,"openfl._Vector.FloatVector","indexOf",0xe9dd4af0,"openfl._Vector.FloatVector.indexOf","openfl/Vector.hx",697,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_716_insertAt,"openfl._Vector.FloatVector","insertAt",0xb3435c85,"openfl._Vector.FloatVector.insertAt","openfl/Vector.hx",716,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_727_iterator,"openfl._Vector.FloatVector","iterator",0x84be29e7,"openfl._Vector.FloatVector.iterator","openfl/Vector.hx",727,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_734_join,"openfl._Vector.FloatVector","join",0xb4c96363,"openfl._Vector.FloatVector.join","openfl/Vector.hx",734,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_739_lastIndexOf,"openfl._Vector.FloatVector","lastIndexOf",0xc7529eba,"openfl._Vector.FloatVector.lastIndexOf","openfl/Vector.hx",739,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_757_pop,"openfl._Vector.FloatVector","pop",0x7ccf8038,"openfl._Vector.FloatVector.pop","openfl/Vector.hx",757,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_772_push,"openfl._Vector.FloatVector","push",0xb8c54153,"openfl._Vector.FloatVector.push","openfl/Vector.hx",772,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_785_removeAt,"openfl._Vector.FloatVector","removeAt",0x9e3f4e50,"openfl._Vector.FloatVector.removeAt","openfl/Vector.hx",785,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_798_reverse,"openfl._Vector.FloatVector","reverse",0x241a3b49,"openfl._Vector.FloatVector.reverse","openfl/Vector.hx",798,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_808_set,"openfl._Vector.FloatVector","set",0x7cd1be49,"openfl._Vector.FloatVector.set","openfl/Vector.hx",808,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_823_shift,"openfl._Vector.FloatVector","shift",0xa56846e9,"openfl._Vector.FloatVector.shift","openfl/Vector.hx",823,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_838_slice,"openfl._Vector.FloatVector","slice",0xa80d1eb9,"openfl._Vector.FloatVector.slice","openfl/Vector.hx",838,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_845_sort,"openfl._Vector.FloatVector","sort",0xbabc56d7,"openfl._Vector.FloatVector.sort","openfl/Vector.hx",845,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_852_splice,"openfl._Vector.FloatVector","splice",0xb3084535,"openfl._Vector.FloatVector.splice","openfl/Vector.hx",852,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_859_toJSON,"openfl._Vector.FloatVector","toJSON",0x6f7308dc,"openfl._Vector.FloatVector.toJSON","openfl/Vector.hx",859,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_866_toString,"openfl._Vector.FloatVector","toString",0x2992b0a5,"openfl._Vector.FloatVector.toString","openfl/Vector.hx",866,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_873_unshift,"openfl._Vector.FloatVector","unshift",0x81d1e5b0,"openfl._Vector.FloatVector.unshift","openfl/Vector.hx",873,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_891_get_length,"openfl._Vector.FloatVector","get_length",0xf96594e8,"openfl._Vector.FloatVector.get_length","openfl/Vector.hx",891,0x4a01873c)
HX_LOCAL_STACK_FRAME(_hx_pos_055b1e986ae1a23a_896_set_length,"openfl._Vector.FloatVector","set_length",0xfce3335c,"openfl._Vector.FloatVector.set_length","openfl/Vector.hx",896,0x4a01873c)
namespace openfl{
namespace _Vector{

void FloatVector_obj::__construct( ::Dynamic length, ::Dynamic fixed,::cpp::VirtualArray array,hx::Null< bool >  __o_forceCopy){
bool forceCopy = __o_forceCopy.Default(false);
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_633_new)
HXLINE( 635)		if (forceCopy) {
HXLINE( 637)			this->_hx___array = ::Array_obj< Float >::__new();
HXLINE( 638)			if (hx::IsNotNull( array )) {
HXLINE( 638)				int _g1 = (int)0;
HXDLIN( 638)				int _g = array->get_length();
HXDLIN( 638)				while((_g1 < _g)){
HXLINE( 638)					_g1 = (_g1 + (int)1);
HXDLIN( 638)					int i = (_g1 - (int)1);
HXDLIN( 638)					::Array< Float > _hx_tmp = this->_hx___array;
HXDLIN( 638)					_hx_tmp[i] = ( (Float)(array->__get(i)) );
            				}
            			}
            		}
            		else {
HXLINE( 642)			if (hx::IsNull( array )) {
HXLINE( 642)				array = ::Array_obj< Float >::__new();
            			}
HXLINE( 643)			this->_hx___array = array;
            		}
HXLINE( 647)		bool _hx_tmp1;
HXDLIN( 647)		if (hx::IsNotNull( length )) {
HXLINE( 647)			_hx_tmp1 = hx::IsGreater( length,(int)0 );
            		}
            		else {
HXLINE( 647)			_hx_tmp1 = false;
            		}
HXDLIN( 647)		if (_hx_tmp1) {
HXLINE( 649)			this->set_length(length);
            		}
HXLINE( 653)		this->fixed = hx::IsEq( fixed,true );
            	}

Dynamic FloatVector_obj::__CreateEmpty() { return new FloatVector_obj; }

void *FloatVector_obj::_hx_vtable = 0;

Dynamic FloatVector_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< FloatVector_obj > _hx_result = new FloatVector_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool FloatVector_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x6497e72d;
}

static ::openfl::_Vector::IVector_obj _hx_openfl__Vector_FloatVector__hx_openfl__Vector_IVector= {
	( int (hx::Object::*)(int))&::openfl::_Vector::FloatVector_obj::set_length,
	( int (hx::Object::*)())&::openfl::_Vector::FloatVector_obj::get_length,
	( ::Dynamic (hx::Object::*)(::Dynamic))&::openfl::_Vector::FloatVector_obj::concat,
	( ::Dynamic (hx::Object::*)())&::openfl::_Vector::FloatVector_obj::copy,
	(  ::Dynamic (hx::Object::*)(int))&::openfl::_Vector::FloatVector_obj::get_c4bfee54,
	( int (hx::Object::*)( ::Dynamic, ::Dynamic))&::openfl::_Vector::FloatVector_obj::indexOf_02dfccf1,
	( void (hx::Object::*)(int, ::Dynamic))&::openfl::_Vector::FloatVector_obj::insertAt_5d1f93e2,
	(  ::Dynamic (hx::Object::*)())&::openfl::_Vector::FloatVector_obj::iterator,
	( ::String (hx::Object::*)(::String))&::openfl::_Vector::FloatVector_obj::join,
	( int (hx::Object::*)( ::Dynamic, ::Dynamic))&::openfl::_Vector::FloatVector_obj::lastIndexOf_02dfccf1,
	(  ::Dynamic (hx::Object::*)())&::openfl::_Vector::FloatVector_obj::pop,
	( int (hx::Object::*)( ::Dynamic))&::openfl::_Vector::FloatVector_obj::push_9c73657a,
	(  ::Dynamic (hx::Object::*)(int))&::openfl::_Vector::FloatVector_obj::removeAt_c4bfee54,
	( ::Dynamic (hx::Object::*)())&::openfl::_Vector::FloatVector_obj::reverse,
	(  ::Dynamic (hx::Object::*)(int, ::Dynamic))&::openfl::_Vector::FloatVector_obj::set_15539e57,
	(  ::Dynamic (hx::Object::*)())&::openfl::_Vector::FloatVector_obj::shift,
	( ::Dynamic (hx::Object::*)( ::Dynamic, ::Dynamic))&::openfl::_Vector::FloatVector_obj::slice,
	( void (hx::Object::*)( ::Dynamic))&::openfl::_Vector::FloatVector_obj::sort,
	( ::Dynamic (hx::Object::*)(int,int))&::openfl::_Vector::FloatVector_obj::splice,
	( ::String (hx::Object::*)())&::openfl::_Vector::FloatVector_obj::toString,
	( void (hx::Object::*)( ::Dynamic))&::openfl::_Vector::FloatVector_obj::unshift_489e4d05,
};

void FloatVector_obj::unshift_489e4d05( ::Dynamic x) {
			unshift(x);
}

 ::Dynamic FloatVector_obj::set_15539e57(int index, ::Dynamic value) {
			return set(index,value);
}

 ::Dynamic FloatVector_obj::removeAt_c4bfee54(int index) {
			return removeAt(index);
}

int FloatVector_obj::push_9c73657a( ::Dynamic x) {
			return push(x);
}

int FloatVector_obj::lastIndexOf_02dfccf1( ::Dynamic x, ::Dynamic from) {
			return lastIndexOf(x,from);
}

void FloatVector_obj::insertAt_5d1f93e2(int index, ::Dynamic element) {
			insertAt(index,element);
}

int FloatVector_obj::indexOf_02dfccf1( ::Dynamic x, ::Dynamic from) {
			return indexOf(x,from);
}

 ::Dynamic FloatVector_obj::get_c4bfee54(int index) {
			return get(index);
}
void *FloatVector_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0x45e7caba: return &_hx_openfl__Vector_FloatVector__hx_openfl__Vector_IVector;
	}
	#ifdef HXCPP_SCRIPTABLE
	return super::_hx_getInterface(inHash);
	#else
	return 0;
	#endif
}

::Dynamic FloatVector_obj::concat(::Dynamic a){
            	HX_GC_STACKFRAME(&_hx_pos_055b1e986ae1a23a_660_concat)
HXDLIN( 660)		if (hx::IsNull( a )) {
HXLINE( 662)			return  ::openfl::_Vector::FloatVector_obj::__alloc( HX_CTX ,null(),null(),this->_hx___array->copy(),null());
            		}
            		else {
HXLINE( 666)			 ::openfl::_Vector::FloatVector other = ( ( ::openfl::_Vector::FloatVector)(a) );
HXLINE( 668)			if ((other->_hx___array->length > (int)0)) {
HXLINE( 670)				return  ::openfl::_Vector::FloatVector_obj::__alloc( HX_CTX ,null(),null(),this->_hx___array->concat(other->_hx___array),null());
            			}
            			else {
HXLINE( 674)				return  ::openfl::_Vector::FloatVector_obj::__alloc( HX_CTX ,null(),null(),this->_hx___array->copy(),null());
            			}
            		}
HXLINE( 660)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC1(FloatVector_obj,concat,return )

::Dynamic FloatVector_obj::copy(){
            	HX_GC_STACKFRAME(&_hx_pos_055b1e986ae1a23a_685_copy)
HXDLIN( 685)		bool _hx_tmp = this->fixed;
HXDLIN( 685)		return  ::openfl::_Vector::FloatVector_obj::__alloc( HX_CTX ,null(),_hx_tmp,this->_hx___array->copy(),null());
            	}


HX_DEFINE_DYNAMIC_FUNC0(FloatVector_obj,copy,return )

Float FloatVector_obj::get(int index){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_692_get)
HXDLIN( 692)		return this->_hx___array->__get(index);
            	}


HX_DEFINE_DYNAMIC_FUNC1(FloatVector_obj,get,return )

int FloatVector_obj::indexOf(Float x, ::Dynamic __o_from){
 ::Dynamic from = __o_from.Default(0);
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_697_indexOf)
HXLINE( 699)		{
HXLINE( 699)			int _g1 = from;
HXDLIN( 699)			int _g = this->_hx___array->length;
HXDLIN( 699)			while((_g1 < _g)){
HXLINE( 699)				_g1 = (_g1 + (int)1);
HXDLIN( 699)				int i = (_g1 - (int)1);
HXLINE( 701)				if ((this->_hx___array->__get(i) == x)) {
HXLINE( 703)					return i;
            				}
            			}
            		}
HXLINE( 709)		return (int)-1;
            	}


HX_DEFINE_DYNAMIC_FUNC2(FloatVector_obj,indexOf,return )

void FloatVector_obj::insertAt(int index,Float element){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_716_insertAt)
HXDLIN( 716)		bool _hx_tmp;
HXDLIN( 716)		if (!(!(this->fixed))) {
HXDLIN( 716)			_hx_tmp = (index < this->_hx___array->length);
            		}
            		else {
HXDLIN( 716)			_hx_tmp = true;
            		}
HXDLIN( 716)		if (_hx_tmp) {
HXLINE( 718)			this->_hx___array->insert(index,element);
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(FloatVector_obj,insertAt,(void))

 ::Dynamic FloatVector_obj::iterator(){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_727_iterator)
HXDLIN( 727)		return this->_hx___array->iterator();
            	}


HX_DEFINE_DYNAMIC_FUNC0(FloatVector_obj,iterator,return )

::String FloatVector_obj::join(::String __o_sep){
::String sep = __o_sep.Default(HX_HCSTRING(",","\x2c","\x00","\x00","\x00"));
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_734_join)
HXDLIN( 734)		return this->_hx___array->join(sep);
            	}


HX_DEFINE_DYNAMIC_FUNC1(FloatVector_obj,join,return )

int FloatVector_obj::lastIndexOf(Float x, ::Dynamic from){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_739_lastIndexOf)
HXLINE( 741)		 ::Dynamic i;
HXDLIN( 741)		bool i1;
HXDLIN( 741)		if (hx::IsNotNull( from )) {
HXLINE( 741)			i1 = hx::IsGreaterEq( from,this->_hx___array->length );
            		}
            		else {
HXLINE( 741)			i1 = true;
            		}
HXDLIN( 741)		if (i1) {
HXLINE( 741)			i = (this->_hx___array->length - (int)1);
            		}
            		else {
HXLINE( 741)			i = from;
            		}
HXLINE( 743)		while(hx::IsGreaterEq( i,(int)0 )){
HXLINE( 745)			if ((this->_hx___array->__get(i) == x)) {
HXLINE( 745)				return i;
            			}
HXLINE( 746)			i = (i - (int)1);
            		}
HXLINE( 750)		return (int)-1;
            	}


HX_DEFINE_DYNAMIC_FUNC2(FloatVector_obj,lastIndexOf,return )

 ::Dynamic FloatVector_obj::pop(){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_757_pop)
HXDLIN( 757)		if (!(this->fixed)) {
HXLINE( 759)			return this->_hx___array->pop();
            		}
            		else {
HXLINE( 763)			return null();
            		}
HXLINE( 757)		return ((Float)0.);
            	}


HX_DEFINE_DYNAMIC_FUNC0(FloatVector_obj,pop,return )

int FloatVector_obj::push(Float x){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_772_push)
HXDLIN( 772)		if (!(this->fixed)) {
HXLINE( 774)			return this->_hx___array->push(x);
            		}
            		else {
HXLINE( 778)			return this->_hx___array->length;
            		}
HXLINE( 772)		return (int)0;
            	}


HX_DEFINE_DYNAMIC_FUNC1(FloatVector_obj,push,return )

Float FloatVector_obj::removeAt(int index){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_785_removeAt)
HXLINE( 787)		bool _hx_tmp;
HXDLIN( 787)		if (!(!(this->fixed))) {
HXLINE( 787)			_hx_tmp = (index < this->_hx___array->length);
            		}
            		else {
HXLINE( 787)			_hx_tmp = true;
            		}
HXDLIN( 787)		if (_hx_tmp) {
HXLINE( 789)			return this->_hx___array->splice(index,(int)1)->__get((int)0);
            		}
HXLINE( 793)		return (int)0;
            	}


HX_DEFINE_DYNAMIC_FUNC1(FloatVector_obj,removeAt,return )

::Dynamic FloatVector_obj::reverse(){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_798_reverse)
HXLINE( 800)		this->_hx___array->reverse();
HXLINE( 801)		return hx::ObjectPtr<OBJ_>(this);
            	}


HX_DEFINE_DYNAMIC_FUNC0(FloatVector_obj,reverse,return )

Float FloatVector_obj::set(int index,Float value){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_808_set)
HXDLIN( 808)		bool _hx_tmp;
HXDLIN( 808)		if (!(!(this->fixed))) {
HXDLIN( 808)			_hx_tmp = (index < this->_hx___array->length);
            		}
            		else {
HXDLIN( 808)			_hx_tmp = true;
            		}
HXDLIN( 808)		if (_hx_tmp) {
HXLINE( 810)			return (this->_hx___array[index] = value);
            		}
            		else {
HXLINE( 814)			return value;
            		}
HXLINE( 808)		return ((Float)0.);
            	}


HX_DEFINE_DYNAMIC_FUNC2(FloatVector_obj,set,return )

 ::Dynamic FloatVector_obj::shift(){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_823_shift)
HXDLIN( 823)		if (!(this->fixed)) {
HXLINE( 825)			return this->_hx___array->shift();
            		}
            		else {
HXLINE( 829)			return null();
            		}
HXLINE( 823)		return ((Float)0.);
            	}


HX_DEFINE_DYNAMIC_FUNC0(FloatVector_obj,shift,return )

::Dynamic FloatVector_obj::slice( ::Dynamic __o_startIndex, ::Dynamic __o_endIndex){
 ::Dynamic startIndex = __o_startIndex.Default(0);
 ::Dynamic endIndex = __o_endIndex.Default(16777215);
            	HX_GC_STACKFRAME(&_hx_pos_055b1e986ae1a23a_838_slice)
HXDLIN( 838)		return  ::openfl::_Vector::FloatVector_obj::__alloc( HX_CTX ,null(),null(),this->_hx___array->slice(startIndex,endIndex),null());
            	}


HX_DEFINE_DYNAMIC_FUNC2(FloatVector_obj,slice,return )

void FloatVector_obj::sort( ::Dynamic f){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_845_sort)
HXDLIN( 845)		this->_hx___array->sort(f);
            	}


HX_DEFINE_DYNAMIC_FUNC1(FloatVector_obj,sort,(void))

::Dynamic FloatVector_obj::splice(int pos,int len){
            	HX_GC_STACKFRAME(&_hx_pos_055b1e986ae1a23a_852_splice)
HXDLIN( 852)		return  ::openfl::_Vector::FloatVector_obj::__alloc( HX_CTX ,null(),null(),this->_hx___array->splice(pos,len),null());
            	}


HX_DEFINE_DYNAMIC_FUNC2(FloatVector_obj,splice,return )

::Array< Float > FloatVector_obj::toJSON(){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_859_toJSON)
HXDLIN( 859)		return this->_hx___array;
            	}


HX_DEFINE_DYNAMIC_FUNC0(FloatVector_obj,toJSON,return )

::String FloatVector_obj::toString(){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_866_toString)
HXDLIN( 866)		if (hx::IsNotNull( this->_hx___array )) {
HXDLIN( 866)			return this->_hx___array->toString();
            		}
            		else {
HXDLIN( 866)			return null();
            		}
HXDLIN( 866)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC0(FloatVector_obj,toString,return )

void FloatVector_obj::unshift(Float x){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_873_unshift)
HXDLIN( 873)		if (!(this->fixed)) {
HXLINE( 875)			this->_hx___array->unshift(x);
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(FloatVector_obj,unshift,(void))

int FloatVector_obj::get_length(){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_891_get_length)
HXDLIN( 891)		return this->_hx___array->length;
            	}


HX_DEFINE_DYNAMIC_FUNC0(FloatVector_obj,get_length,return )

int FloatVector_obj::set_length(int value){
            	HX_STACKFRAME(&_hx_pos_055b1e986ae1a23a_896_set_length)
HXLINE( 898)		bool _hx_tmp;
HXDLIN( 898)		if ((value != this->_hx___array->length)) {
HXLINE( 898)			_hx_tmp = !(this->fixed);
            		}
            		else {
HXLINE( 898)			_hx_tmp = false;
            		}
HXDLIN( 898)		if (_hx_tmp) {
HXLINE( 902)			if ((value > this->_hx___array->length)) {
HXLINE( 904)				_hx_array_set_size_exact(this->_hx___array,value);
            			}
            			else {
HXLINE( 908)				this->_hx___array->removeRange(value,this->_hx___array->length);
            			}
            		}
HXLINE( 939)		return this->_hx___array->length;
            	}


HX_DEFINE_DYNAMIC_FUNC1(FloatVector_obj,set_length,return )


hx::ObjectPtr< FloatVector_obj > FloatVector_obj::__new( ::Dynamic length, ::Dynamic fixed,::cpp::VirtualArray array,hx::Null< bool >  __o_forceCopy) {
	hx::ObjectPtr< FloatVector_obj > __this = new FloatVector_obj();
	__this->__construct(length,fixed,array,__o_forceCopy);
	return __this;
}

hx::ObjectPtr< FloatVector_obj > FloatVector_obj::__alloc(hx::Ctx *_hx_ctx, ::Dynamic length, ::Dynamic fixed,::cpp::VirtualArray array,hx::Null< bool >  __o_forceCopy) {
	FloatVector_obj *__this = (FloatVector_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(FloatVector_obj), true, "openfl._Vector.FloatVector"));
	*(void **)__this = FloatVector_obj::_hx_vtable;
	__this->__construct(length,fixed,array,__o_forceCopy);
	return __this;
}

FloatVector_obj::FloatVector_obj()
{
}

void FloatVector_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(FloatVector);
	HX_MARK_MEMBER_NAME(fixed,"fixed");
	HX_MARK_MEMBER_NAME(_hx___array,"__array");
	HX_MARK_END_CLASS();
}

void FloatVector_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(fixed,"fixed");
	HX_VISIT_MEMBER_NAME(_hx___array,"__array");
}

hx::Val FloatVector_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"get") ) { return hx::Val( get_dyn() ); }
		if (HX_FIELD_EQ(inName,"pop") ) { return hx::Val( pop_dyn() ); }
		if (HX_FIELD_EQ(inName,"set") ) { return hx::Val( set_dyn() ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"copy") ) { return hx::Val( copy_dyn() ); }
		if (HX_FIELD_EQ(inName,"join") ) { return hx::Val( join_dyn() ); }
		if (HX_FIELD_EQ(inName,"push") ) { return hx::Val( push_dyn() ); }
		if (HX_FIELD_EQ(inName,"sort") ) { return hx::Val( sort_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"fixed") ) { return hx::Val( fixed ); }
		if (HX_FIELD_EQ(inName,"shift") ) { return hx::Val( shift_dyn() ); }
		if (HX_FIELD_EQ(inName,"slice") ) { return hx::Val( slice_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"length") ) { if (inCallProp == hx::paccAlways) return hx::Val( get_length() ); }
		if (HX_FIELD_EQ(inName,"concat") ) { return hx::Val( concat_dyn() ); }
		if (HX_FIELD_EQ(inName,"splice") ) { return hx::Val( splice_dyn() ); }
		if (HX_FIELD_EQ(inName,"toJSON") ) { return hx::Val( toJSON_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"__array") ) { return hx::Val( _hx___array ); }
		if (HX_FIELD_EQ(inName,"indexOf") ) { return hx::Val( indexOf_dyn() ); }
		if (HX_FIELD_EQ(inName,"reverse") ) { return hx::Val( reverse_dyn() ); }
		if (HX_FIELD_EQ(inName,"unshift") ) { return hx::Val( unshift_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"insertAt") ) { return hx::Val( insertAt_dyn() ); }
		if (HX_FIELD_EQ(inName,"iterator") ) { return hx::Val( iterator_dyn() ); }
		if (HX_FIELD_EQ(inName,"removeAt") ) { return hx::Val( removeAt_dyn() ); }
		if (HX_FIELD_EQ(inName,"toString") ) { return hx::Val( toString_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"get_length") ) { return hx::Val( get_length_dyn() ); }
		if (HX_FIELD_EQ(inName,"set_length") ) { return hx::Val( set_length_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"lastIndexOf") ) { return hx::Val( lastIndexOf_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val FloatVector_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"fixed") ) { fixed=inValue.Cast< bool >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"length") ) { if (inCallProp == hx::paccAlways) return hx::Val( set_length(inValue.Cast< int >()) ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"__array") ) { _hx___array=inValue.Cast< ::Array< Float > >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void FloatVector_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("fixed","\x74","\xf9","\xa1","\x00"));
	outFields->push(HX_HCSTRING("length","\xe6","\x94","\x07","\x9f"));
	outFields->push(HX_HCSTRING("__array","\x79","\xc6","\xed","\x8f"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo FloatVector_obj_sMemberStorageInfo[] = {
	{hx::fsBool,(int)offsetof(FloatVector_obj,fixed),HX_HCSTRING("fixed","\x74","\xf9","\xa1","\x00")},
	{hx::fsObject /*Array< Float >*/ ,(int)offsetof(FloatVector_obj,_hx___array),HX_HCSTRING("__array","\x79","\xc6","\xed","\x8f")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *FloatVector_obj_sStaticStorageInfo = 0;
#endif

static ::String FloatVector_obj_sMemberFields[] = {
	HX_HCSTRING("fixed","\x74","\xf9","\xa1","\x00"),
	HX_HCSTRING("__array","\x79","\xc6","\xed","\x8f"),
	HX_HCSTRING("concat","\x14","\x09","\xd0","\xc7"),
	HX_HCSTRING("copy","\xb5","\xbb","\xc4","\x41"),
	HX_HCSTRING("get","\x96","\x80","\x4e","\x00"),
	HX_HCSTRING("indexOf","\xc9","\x48","\xbf","\xe0"),
	HX_HCSTRING("insertAt","\x8c","\x7c","\x1f","\xc2"),
	HX_HCSTRING("iterator","\xee","\x49","\x9a","\x93"),
	HX_HCSTRING("join","\xea","\x33","\x65","\x46"),
	HX_HCSTRING("lastIndexOf","\x13","\xfd","\x6a","\x95"),
	HX_HCSTRING("pop","\x91","\x5d","\x55","\x00"),
	HX_HCSTRING("push","\xda","\x11","\x61","\x4a"),
	HX_HCSTRING("removeAt","\x57","\x6e","\x1b","\xad"),
	HX_HCSTRING("reverse","\x22","\x39","\xfc","\x1a"),
	HX_HCSTRING("set","\xa2","\x9b","\x57","\x00"),
	HX_HCSTRING("shift","\x82","\xec","\x22","\x7c"),
	HX_HCSTRING("slice","\x52","\xc4","\xc7","\x7e"),
	HX_HCSTRING("sort","\x5e","\x27","\x58","\x4c"),
	HX_HCSTRING("splice","\x7c","\x85","\x9e","\xbf"),
	HX_HCSTRING("toJSON","\x23","\x49","\x09","\x7c"),
	HX_HCSTRING("toString","\xac","\xd0","\x6e","\x38"),
	HX_HCSTRING("unshift","\x89","\xe3","\xb3","\x78"),
	HX_HCSTRING("get_length","\xaf","\x04","\x8f","\x8f"),
	HX_HCSTRING("set_length","\x23","\xa3","\x0c","\x93"),
	::String(null()) };

static void FloatVector_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(FloatVector_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void FloatVector_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(FloatVector_obj::__mClass,"__mClass");
};

#endif

hx::Class FloatVector_obj::__mClass;

void FloatVector_obj::__register()
{
	hx::Object *dummy = new FloatVector_obj;
	FloatVector_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl._Vector.FloatVector","\x95","\x63","\xf0","\x2f");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = FloatVector_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(FloatVector_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< FloatVector_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = FloatVector_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = FloatVector_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = FloatVector_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace _Vector
