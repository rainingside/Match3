extends IRemoveSpecial
class_name StarsRemoveSpecial

func p_remove_special(special_location:RemoveSpecialLocationData, data:GameData) -> RemoveSpecialData:
	var remove_data:RemoveSpecialData = RemoveSpecialData.new()
	
	var target_index2d:Vector2i = special_location.TargetLocation.Index2d
	var target_block:Block = data.p_get_block(target_index2d)
	if target_block == null || target_block.Data.p_get_block_special_type() != Enums.BlockSpecialTypes.Star:
		return remove_data
	
	var other_index2d:Vector2i = special_location.OtherLocation.Index2d
	var other_block:Block = data.p_get_block(other_index2d)
	if other_block == null ||other_block.Data.p_get_block_special_type() != Enums.BlockSpecialTypes.Star:
		return remove_data
	
	remove_data.ThisRemoveLocations.append(
		RemoveSpecialLocationData.new().p_init(
			special_location.TargetLocation, null))
	remove_data.ThisRemoveLocations.append(
		RemoveSpecialLocationData.new().p_init(
			special_location.OtherLocation, null))
	
	var block:Block
	for row in range(data.Row):
		for column in range(data.Column):
			var rindex2d:Vector2i = Vector2i(row, column)
			if rindex2d == target_index2d || rindex2d == other_index2d:
				continue
			block = data.p_get_block(rindex2d)
			if block and !block.Data.p_is_match_type(target_block.Data):
				remove_data.ThisRemoveLocations.append(
					RemoveSpecialLocationData.new().p_init(
						BlockLocation.new().p_init(rindex2d,
						block.Data.p_get_block_special_type()), null))
	
	return remove_data
