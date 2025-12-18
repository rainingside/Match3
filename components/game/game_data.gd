class_name GameData

var Row:int = 12
var Column:int = 8

var Data:Array[Block] = []

var Vector2iNull:Vector2i = Vector2i(-1, -1)
var SwitchIndex2ds:Array[Vector2i] = []

func _init() -> void:
	Data.resize(Row * Column)
	for i in range(Row * Column):
		Data[i] = null

func p_get_index(block:Block) -> int:
	return Data.find(block)

func p_get_index2d(block:Block) -> Vector2i:
	var i:int = p_get_index(block)
	if i == -1:
		return Vector2iNull
	@warning_ignore("integer_division")
	var x:int = i / Column
	var y:int = i - x * Column
	return Vector2i(x, y)

func p_get_block(index2d:Vector2i) -> Block:
	return Data[index2d.x * Column + index2d.y]

func p_set(index2d:Vector2i, block:Block) -> void:
	Data[index2d.x * Column + index2d.y] = block

func p_get_left_index2d(index2d:Vector2i) -> Vector2i:
	if index2d == Vector2iNull:
		return Vector2iNull
	if index2d.y == 0:
		return Vector2iNull
	return Vector2i(index2d.x, index2d.y - 1)

func p_get_right_index2d(index2d:Vector2i) -> Vector2i:
	if index2d == Vector2iNull:
		return Vector2iNull
	if index2d.y == Column - 1:
		return Vector2iNull
	return Vector2i(index2d.x, index2d.y + 1)

func p_get_up_index2d(index2d:Vector2i) -> Vector2i:
	if index2d == Vector2iNull:
		return Vector2iNull
	if index2d.x == 0:
		return Vector2iNull
	return Vector2i(index2d.x - 1, index2d.y)

func p_get_down_index2d(index2d:Vector2i) -> Vector2i:
	if index2d == Vector2iNull:
		return Vector2iNull
	if index2d.x == Row - 1:
		return Vector2iNull
	index2d.x = index2d.x + 1
	return Vector2i(index2d.x + 1, index2d.y)

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
	for column in range(Column):
		var index2ds:Array[Vector2i] = []
		var empty_index2ds:Array[Vector2i] = []
		for row in range(Row):
			if p_get_block(Vector2i(row, column)) == null:
				empty_index2ds.append(Vector2i(row, column))
			else:
				index2ds.append(Vector2i(row, column))
		if empty_index2ds.size() == Row or empty_index2ds.size() == 0:
			continue
		index2ds.reverse()
		empty_index2ds.reverse()
		var index:int = 0
		for index2d in index2ds:
			var block:Block = p_get_block(index2d)
			block.Data.TargetGPosition.y = p_get_gposition(empty_index2ds[index]).y
			p_set(empty_index2ds[index],block)
			p_set(index2d, null)
			index += 1

func p_is_fill_end() -> bool:
	for block:Block in Data:
		if block == null:
			return false
		if block.global_position.y != block.Data.TargetGPosition.y:
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

func p_remove() -> int:
	var remove_index2ds:Array[Vector2i] = []
	
	return 0

func p_switch(target1:Vector2i, target2:Vector2i) -> void:
	if target1 == Vector2iNull or target2 == Vector2iNull:
		return
	var block1 = p_get_block(target1)
	if block1 == null:
		return
	var block2 = p_get_block(target2)
	if block2 == null:
		return
	block1.Data.TargetGPosition = p_get_gposition(target2)
	block2.Data.TargetGPosition = p_get_gposition(target1)
	p_set(target1, block2)
	p_set(target2, block1)

func p_switch_by_block(block:Block, direction:Enums.BlockDragDirection) -> void:
	var index2d = p_get_index2d(block)
	if index2d == Vector2iNull:
		return
	var target_index2d:Vector2i = Vector2iNull
	match direction:
		Enums.BlockDragDirection.Left:
			target_index2d = p_get_left_index2d(index2d)
		Enums.BlockDragDirection.Right:
			target_index2d = p_get_right_index2d(index2d)
		Enums.BlockDragDirection.Up:
			target_index2d = p_get_up_index2d(index2d)
		Enums.BlockDragDirection.Down:
			target_index2d = p_get_down_index2d(index2d)
	if target_index2d == Vector2iNull:
		return
	p_switch(index2d, target_index2d)
