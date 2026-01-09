class_name IRemoveSpecial

func p_remove_special(_special_location:RemoveSpecialLocationData, _data:GameData) -> RemoveSpecialData:
	return RemoveSpecialData.new()

func p_append_remove_block(remove_data:RemoveSpecialData, index2d:Vector2i, except_index2ds:Array[Vector2i], data:GameData) -> void:
	if except_index2ds.find(index2d) >= 0:
		return
	var block:Block = data.p_get_block(index2d)
	if block:
		var location_data:RemoveSpecialLocationData = RemoveSpecialLocationData.new().p_init(
			BlockLocation.new().p_init(index2d,
			block.Data.p_get_block_special_type()), null)
		if block.Data.BlockFlag == Enums.BlockFlags.Normal:
			remove_data.ThisRemoveLocations.append(location_data)
		else:
			remove_data.NextRemoveLocations.append(location_data)
