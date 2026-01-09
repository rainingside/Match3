extends Node

var m_remove_specials:Dictionary = {}

func p_get_remove_special(special_location:RemoveSpecialLocationData) -> IRemoveSpecial:
	var special_types:Array[Enums.BlockSpecialTypes] = special_location.p_get_special_types()
	if special_types.size() == 0:
		return null
	if special_types.size() > 2:
		return null
	
	@warning_ignore("int_as_enum_without_cast", "int_as_enum_without_match")
	var remove_special_type:Enums.RemoveSpecialTypes = -1
	
	# 单一
	if special_types.size() == 1:
		if special_types[0] == Enums.BlockSpecialTypes.Star:
			remove_special_type = Enums.RemoveSpecialTypes.Star
		elif special_types[0] == Enums.BlockSpecialTypes.Bomb:
			remove_special_type = Enums.RemoveSpecialTypes.Bomb
		elif special_types[0] == Enums.BlockSpecialTypes.Horizontal:
			remove_special_type = Enums.RemoveSpecialTypes.Horizontal
		elif special_types[0] == Enums.BlockSpecialTypes.Vertical:
			remove_special_type = Enums.RemoveSpecialTypes.Vertical
	# 组合
	elif special_types.all(func(p:Enums.RemoveSpecialTypes) -> bool:
		return p == Enums.RemoveSpecialTypes.Star):
		remove_special_type = Enums.RemoveSpecialTypes.Stars
	elif special_types.any(func(p:Enums.RemoveSpecialTypes) -> bool:
		return p == Enums.RemoveSpecialTypes.Star) and special_types.any(func(p:Enums.RemoveSpecialTypes) -> bool:
		return p != Enums.RemoveSpecialTypes.Star):
		remove_special_type = Enums.RemoveSpecialTypes.StartOther
	else:
		remove_special_type = Enums.RemoveSpecialTypes.Others
	
	if remove_special_type == -1:
		return null
	if m_remove_specials.has(remove_special_type):
		return m_remove_specials.get(remove_special_type)
		
	var iremove_special:IRemoveSpecial
	match remove_special_type:
		Enums.RemoveSpecialTypes.Star:
			iremove_special = StarRemoveSpecial.new()
		Enums.RemoveSpecialTypes.Bomb:
			iremove_special = BombRemoveSpecial.new()
		Enums.RemoveSpecialTypes.Horizontal:
			iremove_special = HorizontalRemoveSpecial.new()
		Enums.RemoveSpecialTypes.Vertical:
			iremove_special = VerticalRemoveSpecial.new()
			
		Enums.RemoveSpecialTypes.Stars:
			iremove_special = StarsRemoveSpecial.new()
		Enums.RemoveSpecialTypes.StartOther:
			iremove_special = StarOtherRemoveSpecial.new()
		Enums.RemoveSpecialTypes.Others:
			iremove_special = OthersRemoveSpecial.new()
	
	m_remove_specials[remove_special_type] = iremove_special
	return iremove_special
