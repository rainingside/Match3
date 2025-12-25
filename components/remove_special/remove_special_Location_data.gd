extends Resource
class_name RemoveSpecialLocationData

var TargetLocation:BlockLocation
var OtherLocation:BlockLocation

func p_init(target_location:BlockLocation, other_location:BlockLocation) -> RemoveSpecialLocationData:
	TargetLocation = target_location
	OtherLocation = other_location
	return self

func p_get_special_types() -> Array[Enums.BlockSpecialTypes]:
	var types:Array[Enums.BlockSpecialTypes] = []
	if TargetLocation and TargetLocation.SpecialType >= 0:
		types.append(TargetLocation.SpecialType)
	if OtherLocation and OtherLocation.SpecialType >= 0:
		types.append(OtherLocation.SpecialType)
	return types
