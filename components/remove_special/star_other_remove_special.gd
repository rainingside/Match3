extends IRemoveSpecial
class_name StarOtherRemoveSpecial

func p_remove_special(special_location:RemoveSpecialLocationData, data:GameData) -> RemoveSpecialData:
	var remove_data:RemoveSpecialData = RemoveSpecialData.new()
	
	var target_index2d:Vector2i
	var other_type:Enums.BlockSpecialTypes
	if special_location.TargetLocation.SpecialType == Enums.BlockSpecialTypes.Star:
		target_index2d = special_location.TargetLocation.Index2d
		other_type = special_location.OtherLocation.SpecialType
		remove_data.ThisRemoveLocations.append(special_location)
	else:
		target_index2d = special_location.OtherLocation.Index2d
		other_type = special_location.TargetLocation.SpecialType
		remove_data.ThisRemoveLocations.append(
			RemoveSpecialLocationData.new().p_init(
				special_location.OtherLocation, null))
	
	var block:Block
	for row in range(data.Row):
		for column in range(data.Column):
			var rindex2d:Vector2i = Vector2i(row, column)
			if rindex2d == target_index2d:
				continue
			block = data.p_get_block(rindex2d)
			if block and block.Data.p_get_block_special_type() == other_type:
				remove_data.NextRemoveLocations.append(
					RemoveSpecialLocationData.new().p_init(
						BlockLocation.new().p_init(rindex2d, block.Data.p_get_block_special_type()), null))
	
	return remove_data
