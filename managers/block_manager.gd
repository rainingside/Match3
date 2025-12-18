extends Node
class_name BlockManager

var BlockScene:PackedScene = GConstants.SceneReses.Block


func p_get_random_block() -> Block:
	var block_type = randi_range(0, Enums.BlockTypes.size() - 1) as Enums.BlockTypes
	var block = BlockScene.instantiate() as Block
	var block_data:BlockData = BlockData.new()
	block_data.BlockType = block_type
	block.p_init(block_data)
	return block

	
