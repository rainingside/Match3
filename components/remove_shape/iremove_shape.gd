extends Resource
class_name IRemoveShape

var ShapeData:Array[Vector2i] = []
var ShapeData2d:Array2D
var CenterIndex2d: Vector2i = GConstants.Vector2iNull
@warning_ignore("int_as_enum_without_cast", "int_as_enum_without_match")
var BlockSpecialType:Enums.BlockSpecialTypes = -1


func p_remove(data:GameData) -> Array[RemoveShapeData]:
	var remove_shape_datas: Array[RemoveShapeData] = []
	
	var matchs:Array[Vector2i] = []
	var block_target:Block = null
	var block_match:Block = null
	var data_xy:Vector2i
	
	for row in range(data.Row - ShapeData2d.Row, -1, -1):
		for column in range(data.Column - ShapeData2d.Column + 1):
			var is_all_match:bool = true
			block_target = null
			block_match = null
			var matchs_temp:Array[Vector2i] = []
			
			for shape_data in ShapeData:
				data_xy = Vector2i(row + shape_data.x, column + shape_data.y)
				if matchs.find(data_xy) >= 0:
					is_all_match = false
					break
				if block_target == null:
					block_target = data.p_get_block(data_xy)
					if block_target and block_target.Data.BlockFlag == Enums.BlockFlags.Normal:
						matchs_temp.append(data_xy)
						continue
					else:
						is_all_match = false
						break
				block_match = data.p_get_block(data_xy)
				if block_match == null:
					is_all_match = false
					break
				if block_target.Data.p_is_match_type(block_match.Data):
					matchs_temp.append(data_xy)
				else:
					is_all_match = false
					break
				if is_all_match == false:
					break
			
			if block_target == null or is_all_match == false:
				matchs_temp.clear()
				continue
			
			var remove_data:RemoveShapeData = RemoveShapeData.new()
			remove_data.SpecialIndex2d = Vector2i(row + CenterIndex2d.x, column + CenterIndex2d.y)
			remove_data.SpecialType = BlockSpecialType
			remove_data.RemoveIndex2ds = matchs_temp
			remove_shape_datas.append(remove_data)
			
			matchs.append_array(matchs_temp)
			
	return remove_shape_datas

func p_init_shape_data() -> void:
	for row in ShapeData2d.Row:
		for column in ShapeData2d.Column:
			if ShapeData2d.p_get(row, column) == 1:
				ShapeData.append(Vector2i(row, column))
