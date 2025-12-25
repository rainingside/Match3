extends Resource
class_name RemoveSpecialData

var ThisRemoveLocations:Array[RemoveSpecialLocationData] = []
var NextRemoveLocations:Array[RemoveSpecialLocationData] = []

func p_get_this_remove_count() -> int:
	return ThisRemoveLocations.size()
