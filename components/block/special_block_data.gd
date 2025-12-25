extends IBlockData
class_name SpecialBlockData

var SpecialType:Enums.BlockSpecialTypes

func _init() -> void:
	BlockFlag = Enums.BlockFlags.Special

func p_init(special_type:Enums.BlockSpecialTypes) -> void:
	SpecialType = special_type

func p_is_match_type(other:IBlockData) -> bool:
	if other is SpecialBlockData:
		return SpecialType == other.SpecialType
	return false

func p_get_block_special_type() -> Enums.BlockSpecialTypes:
	return SpecialType;
