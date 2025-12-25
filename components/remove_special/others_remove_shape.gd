extends IRemoveSpecial
class_name OthersRemoveSpecial

func p_remove_special(special_location:RemoveSpecialLocationData, _data:GameData) -> RemoveSpecialData:
	var remove_data:RemoveSpecialData = RemoveSpecialData.new()
	
	remove_data.NextRemoveLocations.append(
		RemoveSpecialLocationData.new().p_init(
			special_location.TargetLocation, null))
	remove_data.NextRemoveLocations.append(
		RemoveSpecialLocationData.new().p_init(
			special_location.OtherLocation, null))
	
	return remove_data
