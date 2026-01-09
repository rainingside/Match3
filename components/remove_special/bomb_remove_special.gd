extends IRemoveSpecial
class_name BombRemoveSpecial

var ShapeData2d:Array2D
var ShapeData:Array[Vector2i]
var CenterIndex2d:Vector2i = Vector2i(2, 2)

func _init() -> void:
	ShapeData2d = Array2D.new(5, 5)
	ShapeData2d.Data = [0, 0, 1, 0, 0,
						0, 1, 1, 1, 0,
						1, 1, 1, 1, 1,
						0, 1, 1, 1, 0,
						0, 0, 1, 0, 0]
	for row in ShapeData2d.Row:
			for column in ShapeData2d.Column:
				if ShapeData2d.p_get(row, column) == 1:
					ShapeData.append(Vector2i(row, column) - CenterIndex2d)

func p_remove_special(special_location:RemoveSpecialLocationData, data:GameData) -> RemoveSpecialData:
	var remove_data:RemoveSpecialData = RemoveSpecialData.new()
	
	var target_index2d:Vector2i = special_location.TargetLocation.Index2d
	var target_block:Block = data.p_get_block(target_index2d)
	if target_block == null or target_block.Data.p_get_block_special_type() != Enums.BlockSpecialTypes.Bomb:
		return remove_data
	
	remove_data.ThisRemoveLocations.append(
		RemoveSpecialLocationData.new().p_init(
			special_location.TargetLocation, null))
	var except_index2ds:Array[Vector2i] = [target_index2d]
	
	for index2d:Vector2i in ShapeData:
			var rindex2d:Vector2i = target_index2d + index2d
			p_append_remove_block(remove_data, rindex2d, except_index2ds, data)
	
	return remove_data
