extends Resource
class_name BlockData

@export var BlockFlag:Enums.BlockFlags
@warning_ignore("int_as_enum_without_cast", "int_as_enum_without_match")
@export var BlockType:Enums.BlockTypes = -1
@warning_ignore("int_as_enum_without_cast", "int_as_enum_without_match")
@export var BlockSpecialType:Enums.BlockSpecialTypes = -1
@export var TargetGPosition:Vector2


func p_init_noraml(block_type:Enums.BlockTypes) -> void:
	BlockFlag = Enums.BlockFlags.Normal
	BlockType = block_type

func p_init_special(block_special_type:Enums.BlockSpecialTypes) -> void:
	BlockFlag = Enums.BlockFlags.Special
	BlockSpecialType = block_special_type


func p_is_match(block_flag:Enums.BlockFlags, other:BlockData) -> bool:
	if BlockFlag != block_flag or other.BlockFlag !=  block_flag:
		return false
	return BlockType == other.BlockType
