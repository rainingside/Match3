class_name IRemoveShape

var ShapeData:Array2D
var CenterIndex2d: Vector2i = Vector2iNull
@warning_ignore("int_as_enum_without_cast", "int_as_enum_without_match")
var BlockSpecialType:Enums.BlockSpecialTypes = -1

var Vector2iNull:Vector2i = Vector2i(-1, -1)

func p_remove(data:GameData) -> Array[BlockDataGenerator]:
	var block_data_generators: Array[BlockDataGenerator] = []
	
	var matchs:Array[Vector2i] = []
	var block_target:Block = null
	var block_match:Block = null
	var data_xy:Vector2i
	
	for row in range(data.Row - ShapeData.Row, -1, -1):
		for column in range(data.Column - ShapeData.Column + 1):
			var is_all_match = true
			block_target = null
			block_match = null
			var matchs_temp:Array[Vector2i] = []
			
			for shape_row in range(ShapeData.Row):
				for shape_column in range(ShapeData.Column):
					if ShapeData.p_get(shape_row, shape_column) == 0:
						continue
					data_xy = Vector2i(row + shape_row, column + shape_column)
					if matchs.find(data_xy) >= 0:
						is_all_match = false
						break
					if block_target == null:
						block_target = data.p_get_block(data_xy)
						if block_target:
							matchs_temp.append(data_xy)
							continue
						else:
							is_all_match = false
							break
					block_match = data.p_get_block(data_xy)
					if block_match == null:
						is_all_match = false
						break
					if block_target.Data.p_is_match(block_match.Data):
						matchs_temp.append(data_xy)
					else:
						is_all_match = false
						break
				if is_all_match == false:
					break
			
			if block_target == null or is_all_match == false:
				matchs_temp.clear()
				continue
			
			var generator = BlockDataGenerator.new()
			generator.Index2d = Vector2i(row + CenterIndex2d.x, column + CenterIndex2d.y)
			generator.BlockSpecialType = BlockSpecialType
			generator.RemoveIndex2ds = matchs_temp
			block_data_generators.append(generator)
			
			matchs.append_array(matchs_temp)
			
	return block_data_generators
