package;

class Omniscient
{
    public static function isAbilityBH(id:ID):Bool
    {
        var abilitiesInfo:Xml = XMLUtils.fromFile("data\\Abilities.xml");
		var eligible:Bool = false;
		
		for (node in abilitiesInfo.elementsNamed("ability"))
			if (node.get("id") == id.getName())
			{
				for (node2 in node.elementsNamed("strike"))
					eligible = node2.firstChild().nodeValue == "Bolt" || node2.firstChild().nodeValue == "Kick";
				break;
			}
		return eligible;
    }

    public function isAbilityPassive(id:ID):Bool
	{
		var abilitiesInfo:Xml = XMLUtils.fromFile("data\\Abilities.xml");
		for (node in abilitiesInfo.elementsNamed("ability"))
			if (node.get("id") == id.getName())
				for (node2 in node.elementsNamed("type"))
					return node2.firstChild().nodeValue == "Passive";
		throw "Not found in Omniscient.isAbilityPassive()";
	}
}