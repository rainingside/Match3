extends IRemoveSpecial
class_name HorizontalRemoveSpecial

func p_remove_special(special_location:RemoveSpecialLocationData, data:GameData) -> RemoveSpecialData:
	var remove_data:RemoveSpecialData = RemoveSpecialData.new()
	
	var target_index2d:Vector2i = special_location.TargetLocation.Index2d
	var target_block:Block = data.p_get_block(target_index2d)
	if target_block == null or target_block.Data.p_get_block_special_type() != Enums.BlockSpecialTypes.Horizontal:
		return remove_data
	
	remove_data.ThisRemoveLocations.append(
		RemoveSpecialLocationData.new().p_init(
			special_location.TargetLocation, null))
	var except_index2ds:Array[Vector2i] = [target_index2d]
	
	for column in range(data.Column):
		var rindex2d:Vector2i = Vector2i(target_index2d.x, column)
		p_append_remove_block(remove_data, rindex2d, except_index2ds, data)
	
	return remove_data
