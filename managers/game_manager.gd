extends IManager
class_name GameManager

@export var CanvaNode:Node2D

var GameDatas:GameData = GameData.new()
var BlockScene:PackedScene = GConstants.SceneReses.Block

func p_fill() -> void:
	var empty_count:int = GameDatas.p_get_empty_count()
	if empty_count == 0:
		return
	var blocks:Array[Block] = []
	for i in range(empty_count):
		var block:Block = get_random_block()
		blocks.append(block)
	GameDatas.p_fill(blocks)
	add_blocks(blocks)
		
func p_is_fill_end() -> bool:
	return GameDatas.p_is_fill_end();


func p_remove_by_shape(remove_shape:IRemoveShape) -> int:
	var remove_count:int = 0
	var remove_datas: Array[RemoveShapeData] = remove_shape.p_remove(GameDatas)
	for remove_data in remove_datas:
		remove_count += remove_data.RemoveIndex2ds.size()
		
		for index2d in remove_data.RemoveIndex2ds:
			var block:Block = GameDatas.p_get_block(index2d)
			GameDatas.p_set(index2d, null)
			if block:
				block.queue_free()
			
		if remove_data.SpecialType >= 0:
			var special_block:Block = get_special_block(remove_data.SpecialType)
			special_block.position = GameDatas.p_get_position(remove_data.SpecialIndex2d)
			special_block.Data.TargetPosition = special_block.position
			GameDatas.p_set(remove_data.SpecialIndex2d, special_block)
			add_block(special_block)
	return remove_count


func p_start_drag() -> bool:
	return GameDatas.p_start_drag(CanvaNode.get_local_mouse_position())

func p_end_drag() -> bool:
	return GameDatas.p_end_drag()

func p_is_drag_ok() -> bool:
	return GameDatas.p_is_drag_ok()

func on_block_droped(block: Block, drag_direction:Enums.BlockDragDirection) -> void:
	GameDatas.p_switch_by_block(block, drag_direction)

func p_is_switch_end() -> bool:
	return GameDatas.p_is_switch_end()

func p_is_switch_have_special() -> bool:
	return GameDatas.p_is_switch_have_special()

func p_get_switch_remove_special_data() -> RemoveSpecialData:
	if GameDatas.SwitchIndex2ds.size() != 2:
		return null
	var index1:Vector2i = GameDatas.SwitchIndex2ds[0]
	var index2:Vector2i = GameDatas.SwitchIndex2ds[1]
	var block1:Block = GameDatas.p_get_block(index1)
	if block1 == null:
		return null
	var block2:Block = GameDatas.p_get_block(index2)
	if block2 == null:
		return null
	if block1.Data.BlockFlag != Enums.BlockFlags.Special and block2.Data.BlockFlag != Enums.BlockFlags.Special:
		return null
	
	var location1:BlockLocation = BlockLocation.new().p_init(index1, block1.Data.p_get_block_special_type())
	var location2:BlockLocation = BlockLocation.new().p_init(index2, block2.Data.p_get_block_special_type())
	
	var remove_data:RemoveSpecialData = RemoveSpecialData.new()
	if block1.Data.BlockFlag == Enums.BlockFlags.Special:
		remove_data.NextRemoveLocations.append(
			RemoveSpecialLocationData.new().p_init(location1, location2))
	else :
		remove_data.NextRemoveLocations.append(
			RemoveSpecialLocationData.new().p_init(location2, location1))
	return remove_data

func p_remove_special(special_location:RemoveSpecialLocationData) -> RemoveSpecialData:
	var remove_special_data:RemoveSpecialData = RemoveSpecialData.new()
	var iremove_special:IRemoveSpecial = GRemoveSpecialHelper.p_get_remove_special(special_location)
	if iremove_special == null:
		return remove_special_data
	
	remove_special_data = iremove_special.p_remove_special(special_location, GameDatas)
	
	for rdata:RemoveSpecialLocationData in remove_special_data.ThisRemoveLocations:
		var block:Block = GameDatas.p_get_block(rdata.TargetLocation.Index2d)
		GameDatas.p_set(rdata.TargetLocation.Index2d, null)
		if block:
			block.queue_free()
			
	return remove_special_data

func p_switch_success() -> void:
	GameDatas.p_switch_success()

func p_switch_cancel() -> void:
	GameDatas.p_switch_cancel()
	
func p_is_switch_cancel_end() -> bool:
	return GameDatas.p_is_switch_cancel_end()

func p_switch_cancel_end() -> void:
	GameDatas.p_switch_cancel_end()




func add_block(block:Block) -> void:
	CanvaNode.add_child(block)
	block.droped.connect(on_block_droped, ConnectFlags.CONNECT_DEFERRED)
	
func add_blocks(blocks:Array[Block]) -> void:
	for block in blocks:
		add_block(block)
		


func get_random_block() -> Block:
	var block_type:Enums.BlockTypes = randi_range(0, Enums.BlockTypes.size() - 1) as Enums.BlockTypes
	var block:Block = BlockScene.instantiate() as Block
	var block_data:IBlockData = NormalBlockData.new()
	block_data.p_init(block_type)
	block.p_init(block_data)
	return block

func get_special_block(special_type:Enums.BlockSpecialTypes) -> Block:
	var block:Block = BlockScene.instantiate()
	var block_data:IBlockData = SpecialBlockData.new()
	block_data.p_init(special_type)
	block.p_init(block_data)
	return block
