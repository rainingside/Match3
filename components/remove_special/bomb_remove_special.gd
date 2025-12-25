extends IRemoveSpecial
class_name BombRemoveSpecial

var RemoveRange:int = 3

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
	
	var min_row:int = clampi(target_index2d.x - RemoveRange + 1, 0, data.Row - 1)
	var max_row:int = clampi(target_index2d.x + RemoveRange - 1, 0, data.Row - 1)
	var min_column:int = clampi(target_index2d.y - RemoveRange + 1, 0, data.Column -1)
	var max_column:int = clampi(target_index2d.y + RemoveRange - 1, 0, data.Column -1)
	for row in range(min_row, max_row + 1, 1):
		for column in range(min_column, max_column + 1, 1):
			var rindex2d = Vector2i(row, column)
			p_append_remove_block(remove_data, rindex2d, except_index2ds, data)
	
	return remove_data
