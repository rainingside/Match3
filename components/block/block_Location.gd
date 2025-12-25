extends Resource
class_name BlockLocation

var Index2d:Vector2i
var SpecialType:Enums.BlockSpecialTypes

func p_init(index2d:Vector2i, special_type:Enums.BlockSpecialTypes) -> BlockLocation:
	Index2d = index2d
	SpecialType = special_type
	return self
