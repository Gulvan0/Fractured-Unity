package roaming.data;
import roaming.Tree;

/**
 * ...
 * @author Gulvan
 */
typedef AttributeGains = {
	var strength:Int;
	var flow:Int;
	var intellect:Int;
}
 
class Units 
{

	public static function getAttrGain(element:Element):AttributeGains
	{
		var gains:AttributeGains = {strength: -1, flow: -1, intellect: -1};
		
		switch (element)
		{
			case Element.Fire:
				gains.strength = 2;
				gains.flow = 4;
				gains.intellect = 2;
			case Element.Frost:
				gains.strength = 3;
				gains.flow = 2;
				gains.intellect = 3;
			case Element.Poison:
				gains.strength = 3;
				gains.flow = 3;
				gains.intellect = 2;
			case Element.Terra:
				gains.strength = 6;
				gains.flow = 1;
				gains.intellect = 1;
			case Element.Shadow:
				gains.strength = 2;
				gains.flow = 2;
				gains.intellect = 4;
			case Element.Lightning:
				gains.strength = 1;
				gains.flow = 2;
				gains.intellect = 5;
			case Element.Physical, Element.Natura:
				trace("WARN//Non-valid element attributes gain retrieve attempt");
		}
		
		return gains;
	}
	
}