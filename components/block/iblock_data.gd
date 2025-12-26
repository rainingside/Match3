extends Resource
class_name IBlockData

@export var BlockFlag:Enums.BlockFlags
@export var TargetPosition:Vector2

func p_is_match_type(_other:IBlockData) -> bool:
	return false

func p_get_block_special_type() -> Enums.BlockSpecialTypes:
	@warning_ignore("int_as_enum_without_cast", "int_as_enum_without_match")
	return -1;
