extends IGameState
class_name GameSwitchRemoveNormalState

var RemoveShapesCount:int = 0
var RemoveCount:int = 0

func p_enter():
	RemoveShapesCount = GConstants.RemoveShapes.size()
	RemoveCount = 0

func p_exit():
	pass

func p_update(_delta:float):
	pass

func p_physics_update(_delta:float):
	if RemoveShapesCount > 0:
		RemoveCount += GameMgr.p_remove_by_shape(GConstants.RemoveShapes[GConstants.RemoveShapes.size() - RemoveShapesCount])
		RemoveShapesCount -= 1
		return
	
	if RemoveCount > 0:
		GameMgr.p_switch_success()
		Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Fill))
	else:
		Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.SwitchCancel))

func _to_string() -> String:
	return GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.SwitchRemoveNormal)
