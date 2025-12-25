extends IGameState
class_name GameSwitchRemoveSpecialState


var NextRemoveDatas:Array[RemoveSpecialLocationData] = []
var RemoveCount:int = 0

func p_enter():
	RemoveCount = 0
	var remove_data:RemoveSpecialData = GameMgr.p_get_switch_remove_special_data()
	if remove_data:
		NextRemoveDatas.append_array(remove_data.NextRemoveLocations)
	
func p_exit():
	RemoveCount = 0

func p_update(_delta:float):
	pass

func p_physics_update(_delta:float):
	if NextRemoveDatas.size() == 0:
		if RemoveCount > 0:
			GameMgr.p_switch_success()
			Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Fill))
		else :
			Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.SwitchCancel))
		return
	
	var remove_data:RemoveSpecialData = GameMgr.p_remove_special(NextRemoveDatas.get(NextRemoveDatas.size() - 1))
	NextRemoveDatas.resize(NextRemoveDatas.size() - 1)
	RemoveCount += remove_data.p_get_this_remove_count()
	if remove_data.NextRemoveLocations.size() > 0:
		remove_data.NextRemoveLocations.reverse()
		NextRemoveDatas.append_array(remove_data.NextRemoveLocations)

func _to_string() -> String:
	return GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.SwitchRemoveSpecial)
