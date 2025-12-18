extends Node
class_name GameManager

@export var BlockMgr:BlockManager

var GameDatas:GameData = GameData.new()

func p_fill() -> void:
	var empty_count = GameDatas.p_get_empty_count()
	if empty_count == 0:
		return
	var blocks:Array[Block] = []
	for i in range(empty_count):
		var block:Block = BlockMgr.p_get_random_block()
		blocks.append(block)
	GameDatas.p_fill(blocks)
	for block in blocks:
		add_child(block)
		
func p_is_fill_end() -> bool:
	return GameDatas.p_is_fill_end();
