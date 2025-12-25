extends Resource
class_name IBlockData

@export var BlockFlag:Enums.BlockFlags
@export var TargetGPosition:Vector2

func p_is_match_type(other:IBlockData) -> bool:
	return false

func p_get_block_special_type() -> Enums.BlockSpecialTypes:
	return -1;
