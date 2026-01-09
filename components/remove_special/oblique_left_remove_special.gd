extends IRemoveSpecial
class_name ObliqueLeftRemoveSpecial

func p_remove_special(special_location:RemoveSpecialLocationData, data:GameData) -> RemoveSpecialData:
	var remove_data:RemoveSpecialData = RemoveSpecialData.new()
	
	var target_index2d:Vector2i = special_location.TargetLocation.Index2d
	var target_block:Block = data.p_get_block(target_index2d)
	if target_block == null or target_block.Data.p_get_block_special_type() != Enums.BlockSpecialTypes.ObliqueLeft:
		return remove_data
	
	remove_data.ThisRemoveLocations.append(
		RemoveSpecialLocationData.new().p_init(
			special_location.TargetLocation, null))
	var except_index2ds:Array[Vector2i] = [target_index2d]
	
	var tx:int
	var ty:int
	
	tx = target_index2d.x + 1
	ty = target_index2d.y - 1
	while tx < data.Row and ty >= 0:
		var rindex2d:Vector2i = Vector2i(tx, ty)
		p_append_remove_block(remove_data, rindex2d, except_index2ds, data)
		tx += 1
		ty -= 1
	
	tx = target_index2d.x - 1
	ty = target_index2d.y + 1
	while tx >= 0 and ty < data.Column:
		var rindex2d:Vector2i = Vector2i(tx, ty)
		p_append_remove_block(remove_data, rindex2d, except_index2ds, data)
		tx -= 1
		ty += 1
	
	return remove_data
