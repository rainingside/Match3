class_name GameData

var Row:int = 12
var Column:int = 8

var Data:Array[Block] = []

var DragBlock:Block

var SwitchIndex2ds:Array[Vector2i] = []
var SwitchCancelIndex2ds:Array[Vector2i] = []

func _init() -> void:
	Data.resize(Row * Column)
	for i in range(Row * Column):
		Data[i] = null

func p_get_index(block:Block) -> int:
	return Data.find(block)

func p_get_index2d(block:Block) -> Vector2i:
	var i:int = p_get_index(block)
	if i == -1:
		return GConstants.Vector2iNull
	@warning_ignore("integer_division")
	var x:int = i / Column
	var y:int = i - x * Column
	return Vector2i(x, y)

func p_get_index2d_by_gposition(gposition:Vector2) -> Vector2i:
	if gposition.x <= 0 || gposition.x >= Column * GConstants.BlockSize:
		return GConstants.Vector2iNull
	if gposition.y <= 0 || gposition.y >= Row * GConstants.BlockSize:
		return GConstants.Vector2iNull
	@warning_ignore("narrowing_conversion")
	var targetx:int = gposition.y / GConstants.BlockSize
	@warning_ignore("narrowing_conversion")
	var targety:int = gposition.x / GConstants.BlockSize
	return Vector2i(targetx, targety)

func p_get_block(index2d:Vector2i) -> Block:
	return Data[index2d.x * Column + index2d.y]

func p_get_block_by_gpositon(gposition:Vector2) -> Block:
	var target_index2d = p_get_index2d_by_gposition(gposition)
	if target_index2d == GConstants.Vector2iNull:
		return null
	return p_get_block(target_index2d)

func p_set(index2d:Vector2i, block:Block) -> void:
	Data[index2d.x * Column + index2d.y] = block

func p_get_random_normal_block() -> Block:
	var block:Block
	for row in range(Row):
		for column in range(Column):
			block = p_get_block(Vector2i(row, column))
			if block and block.Data.BlockFlag == Enums.BlockFlags.Normal:
				return block
	return null
	

func p_get_left_index2d(index2d:Vector2i) -> Vector2i:
	if index2d == GConstants.Vector2iNull:
		return GConstants.Vector2iNull
	if index2d.y == 0:
		return GConstants.Vector2iNull
	return Vector2i(index2d.x, index2d.y - 1)

func p_get_left_index2d_by_gposition(gposition:Vector2) -> Vector2i:
	return p_get_left_index2d(p_get_index2d_by_gposition(gposition))

func p_get_right_index2d(index2d:Vector2i) -> Vector2i:
	if index2d == GConstants.Vector2iNull:
		return GConstants.Vector2iNull
	if index2d.y == Column - 1:
		return GConstants.Vector2iNull
	return Vector2i(index2d.x, index2d.y + 1)

func p_get_right_index2d_by_gposition(gposition:Vector2) -> Vector2i:
	return p_get_right_index2d(p_get_index2d_by_gposition(gposition))

func p_get_up_index2d(index2d:Vector2i) -> Vector2i:
	if index2d == GConstants.Vector2iNull:
		return GConstants.Vector2iNull
	if index2d.x == 0:
		return GConstants.Vector2iNull
	return Vector2i(index2d.x - 1, index2d.y)

func p_get_up_index2d_by_gposition(gposition:Vector2) -> Vector2i:
	return p_get_up_index2d(p_get_index2d_by_gposition(gposition))

func p_get_down_index2d(index2d:Vector2i) -> Vector2i:
	if index2d == GConstants.Vector2iNull:
		return GConstants.Vector2iNull
	if index2d.x == Row - 1:
		return GConstants.Vector2iNull
	return Vector2i(index2d.x + 1, index2d.y)

func p_get_down_index2d_by_gposition(gposition:Vector2) -> Vector2i:
	return p_get_down_index2d(p_get_index2d_by_gposition(gposition))

func p_get_direciton_index2d(index2d:Vector2i, direction:Enums.BlockDragDirection) -> Vector2i:
	var target_index2d:Vector2i = GConstants.Vector2iNull
	match direction:
		Enums.BlockDragDirection.Left:
			target_index2d = p_get_left_index2d(index2d)
		Enums.BlockDragDirection.Right:
			target_index2d = p_get_right_index2d(index2d)
		Enums.BlockDragDirection.Up:
			target_index2d = p_get_up_index2d(index2d)
		Enums.BlockDragDirection.Down:
			target_index2d = p_get_down_index2d(index2d)
	return target_index2d

func p_get_direciton_index2d_by_gposition(gposition:Vector2, direction:Enums.BlockDragDirection) -> Vector2i:
	var index2d:Vector2i = p_get_index2d_by_gposition(gposition)
	return p_get_direciton_index2d(index2d, direction)

func p_get_gposition(index2d:Vector2i) -> Vector2:
	@warning_ignore("integer_division")
	return Vector2(GConstants.BlockSize / 2 + GConstants.BlockSize * index2d.y, GConstants.BlockSize / 2 + GConstants.BlockSize * index2d.x)

func p_get_empty_count() -> int:
	var empty_count:int = 0
	for data:Block in Data:
		if data == null:
			empty_count += 1
	return empty_count

func p_get_column_empty_count(column:int) -> int:
	var empty_count:int = 0
	for row in range(Row):
		if p_get_block(Vector2i(row, column)) == null:
			empty_count += 1
	return empty_count
	
func p_get_column_empty_init_gposition(column:int, empty_count:int) -> Array[Vector2]:
	var gpositions:Array[Vector2] = []
	for index in range(empty_count):
		@warning_ignore("integer_division")
		gpositions.append(Vector2(GConstants.BlockSize / 2 + column * GConstants.BlockSize, -GConstants.BlockSize / 2 - (empty_count - index - 1) * GConstants.BlockSize))
	return gpositions

func p_get_column_empty_target_gposition(column:int, empty_count:int) -> Array[Vector2]:
	var gpositions:Array[Vector2] = []
	for index in range(empty_count):
		@warning_ignore("integer_division")
		gpositions.append(Vector2( GConstants.BlockSize / 2 + column * GConstants.BlockSize, GConstants.BlockSize / 2 + index * GConstants.BlockSize))
	return gpositions

func p_move_bottom() -> void:
	var block:Block = null
	for column in range(Column):
		for row in range(Row - 1, -1, -1):
			if p_get_block(Vector2i(row, column)):
				continue
			block = null
			for row1 in range(row - 1, -1, -1):
				block = p_get_block(Vector2i(row1, column))
				if block:
					block.Data.TargetGPosition.y = p_get_gposition(Vector2i(row, column)).y
					p_set(Vector2i(row, column), block)
					p_set(Vector2i(row1, column), null)
					break
		

func p_is_fill_end() -> bool:
	for block:Block in Data:
		if block == null:
			return false
		if !block.p_is_move_end():
			return false
	return true

func p_fill(blocks:Array[Block]) -> void:
	p_move_bottom()
	var index:int = 0
	for column:int in range(Column):
		var empty_count:int = p_get_column_empty_count(column)
		if empty_count == 0:
			continue
		var init_gpositions:Array[Vector2] = p_get_column_empty_init_gposition(column, empty_count)
		var target_gpositons:Array[Vector2] = p_get_column_empty_target_gposition(column, empty_count)
		for i in empty_count:
			blocks[index].global_position = init_gpositions[i]
			blocks[index].Data.TargetGPosition = target_gpositons[i]
			p_set(Vector2i(i, column), blocks[index])
			index += 1


func p_start_drag(mouse_gpostion:Vector2) -> bool:
	var block:Block = p_get_block_by_gpositon(mouse_gpostion)
	if block == null:
		return false
	DragBlock = block
	DragBlock.p_start_drag()
	return true

func p_end_drag() -> bool:
	if DragBlock == null:
		return false
	return DragBlock.p_end_drag()
	
func p_is_drag_ok() -> bool:
	if SwitchIndex2ds.size() == 2:
		return true
	return false

func p_switch(target1:Vector2i, target2:Vector2i) -> void:
	if target1 == GConstants.Vector2iNull or target2 == GConstants.Vector2iNull:
		return
	var block1 = p_get_block(target1)
	if block1 == null:
		return
	var block2 = p_get_block(target2)
	if block2 == null:
		return
	block1.Data.TargetGPosition = block2.global_position
	block2.Data.TargetGPosition = block1.global_position
	p_set(target1, block2)
	p_set(target2, block1)
	SwitchIndex2ds.append(target1)
	SwitchIndex2ds.append(target2)

func p_switch_by_block(block:Block, direction:Enums.BlockDragDirection) -> void:
	var index2d = p_get_index2d(block)
	if index2d == GConstants.Vector2iNull:
		return
	var target_index2d = p_get_direciton_index2d(index2d, direction)
	if target_index2d == GConstants.Vector2iNull:
		return
	p_switch(index2d, target_index2d)

func p_is_switch_end() -> bool:
	var is_switch_end:bool = true
	for index2d in SwitchIndex2ds:
		var block:Block = p_get_block(index2d)
		if !block.p_is_move_end():
			is_switch_end = false
			break
	return is_switch_end

func p_is_switch_have_special() -> bool:
	var switch_is_special:bool = false
	for index2d in SwitchIndex2ds:
		var block:Block = p_get_block(index2d)
		if block.Data.BlockFlag == Enums.BlockFlags.Special:
			switch_is_special = true
			break
	return switch_is_special

func p_switch_success() -> void:
	SwitchIndex2ds.clear()
	SwitchCancelIndex2ds.clear()

func p_switch_cancel() -> void:
	var block1 = p_get_block(SwitchIndex2ds[0])
	var block2 = p_get_block(SwitchIndex2ds[1])
	block1.Data.TargetGPosition = block2.global_position
	block2.Data.TargetGPosition = block1.global_position
	p_set(SwitchIndex2ds[0], block2)
	p_set(SwitchIndex2ds[1], block1)
	SwitchCancelIndex2ds.clear()
	SwitchCancelIndex2ds.append_array(SwitchIndex2ds)
	SwitchIndex2ds.clear()

func p_is_switch_cancel_end() -> bool:
	var is_switch_cancel_end:bool = true
	for index2d in SwitchCancelIndex2ds:
		var block:Block = p_get_block(index2d)
		if !block.p_is_move_end():
			is_switch_cancel_end = false
			break
	return is_switch_cancel_end

func p_switch_cancel_end():
	SwitchCancelIndex2ds.clear()
