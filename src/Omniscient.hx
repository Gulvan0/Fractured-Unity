package;

import ConnectionManager.BHParameterUnit;
import ConnectionManager.BHParameterDetails;
import engine.XMLUtils;

class Omniscient
{
    public static function isAbilityBH(id:ID.AbilityID):Bool
    {
        var abilitiesInfo:Xml = XMLUtils.fromFile("data\\Abilities.xml");
		for (node in abilitiesInfo.elementsNamed("ability"))
			if (node.get("id") == id.getName())
				return node.elementsNamed("bh").hasNext();
		throw 'Ability not found: $id in Omniscient.isAbilityBH()';
    }

    public function isAbilityPassive(id:ID.AbilityID):Bool
	{
		var abilitiesInfo:Xml = XMLUtils.fromFile("data\\Abilities.xml");
		for (node in abilitiesInfo.elementsNamed("ability"))
			if (node.get("id") == id.getName())
				for (node2 in node.elementsNamed("type"))
					return node2.firstChild().nodeValue == "Passive";
		throw "Not found in Omniscient.isAbilityPassive()";
	}

	public static function particleCount(id:ID.AbilityID):Int
    {
        var abilitiesInfo:Xml = XMLUtils.fromFile("data\\Abilities.xml");
		for (node in abilitiesInfo.elementsNamed("ability"))
			if (node.get("id") == id.getName())
				for (node2 in node.elementsNamed("bh"))
					for (node3 in node2.elementsNamed("count"))
						return Std.parseInt(node3.firstChild().nodeValue);
		throw 'Ability not found or not BH: $id in Omniscient.particleCount()';
    }

	public static function bhParameters(id:ID.AbilityID):Array<BHParameterDetails>
    {
		var abilitiesInfo:Xml = XMLUtils.fromFile("data\\Abilities.xml");
		for (node in abilitiesInfo.elementsNamed("ability"))
			if (node.get("id") == id.getName())
				for (node2 in node.elementsNamed("bh"))
					return [for (node3 in node2.elementsNamed("param")) new BHParameterDetails(node3.get("name"), BHParameterUnit.createByName(node3.elementsNamed("unit").next().firstChild().nodeValue), Std.parseFloat(node3.elementsNamed("from").next().firstChild().nodeValue), Std.parseFloat(node3.elementsNamed("to").next().firstChild().nodeValue))];
		throw 'Ability not found, not BH or hasn\'t any parameter: $id in Omniscient.bhParameters()';
	}
}