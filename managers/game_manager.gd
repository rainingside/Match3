extends Node
class_name GameManager

@export var CanvaNode:Node2D
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
	add_blocks(blocks)
		
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
			add_block(special_block)
	return remove_count


func p_start_drag() -> bool:
	return GameDatas.p_start_drag(CanvaNode.get_global_mouse_position())

func p_is_drag_ok() -> bool:
	return GameDatas.p_is_drag_ok()

func on_block_droped(block: Block, drag_direction:Enums.BlockDragDirection) -> void:
	GameDatas.p_switch_by_block(block, drag_direction)

func p_is_switch_end() -> bool:
	return GameDatas.p_is_switch_end()

func p_is_switch_have_special() -> bool:
	return GameDatas.p_is_switch_have_special()

func p_switch_success() -> void:
	GameDatas.p_switch_success()

func p_switch_cancel() -> void:
	GameDatas.p_switch_cancel()
	
func p_is_switch_cancel_end() -> bool:
	return GameDatas.p_is_switch_cancel_end()

func p_switch_cancel_end():
	GameDatas.p_switch_cancel_end()

func add_block(block:Block) -> void:
	add_child(block)
	block.droped.connect(on_block_droped, ConnectFlags.CONNECT_DEFERRED)
	
func add_blocks(blocks:Array[Block]) -> void:
	for block in blocks:
		add_block(block)
