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

func p_remove_by_shape(remove_shape:IRemoveShape) -> int:
	var remove_count:int = 0
	var generators = remove_shape.p_remove(GameDatas)
	for generator in generators:
		remove_count += generator.RemoveIndex2ds.size()
		
		for index2d in generator.RemoveIndex2ds:
			var block:Block = GameDatas.p_get_block(index2d)
			GameDatas.p_set(index2d, null)
			if block:
				block.queue_free()
			
		if generator.BlockSpecialType >= 0:
			var special_block = BlockMgr.p_get_special_block(generator)
			special_block.global_position = GameDatas.p_get_gposition(generator.Index2d)
			special_block.Data.TargetGPosition = special_block.global_position
			GameDatas.p_set(generator.Index2d, special_block)
			add_child(special_block)
	return remove_count
