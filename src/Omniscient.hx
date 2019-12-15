package;

class Omniscient
{
    public static function isAbilityBH(id:ID):Bool
    {
        var abilitiesInfo:Xml = XMLUtils.fromFile("data\\Abilities.xml");
		for (node in abilitiesInfo.elementsNamed("ability"))
			if (node.get("id") == id.getName())
				return node.elementsNamed("bh").hasNext();
		throw 'Ability not found: $id in Omniscient.isAbilityBH()';
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

	public static function particleCount(id:ID):Int
    {
        var abilitiesInfo:Xml = XMLUtils.fromFile("data\\Abilities.xml");
		for (node in abilitiesInfo.elementsNamed("ability"))
			if (node.get("id") == id.getName())
				for (node2 in node.elementsNamed("bh"))
					for (node3 in node2.elementsNamed("count"))
						return Std.parseInt(node3.firstChild().nodeValue);
		throw 'Ability not found or not BH: $id in Omniscient.particleCount()';
    }
}