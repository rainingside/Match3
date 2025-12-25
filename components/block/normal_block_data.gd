extends IBlockData
class_name NormalBlockData

@export var BlockType:Enums.BlockTypes

func _init() -> void:
	BlockFlag = Enums.BlockFlags.Normal

func p_init(block_type:Enums.BlockTypes) -> void:
	BlockType = block_type

func p_is_match_type(other:IBlockData) -> bool:
	if other is NormalBlockData:
		return BlockType == other.BlockType
	return false
