extends IGameState
class_name GameRemoveState

var RemoveShapesCount:int = 0
var RemoveCount:int = 0

func p_enter() -> void:
	RemoveShapesCount = GConstants.RemoveShapes.size()
	RemoveCount = 0

func p_exit() -> void:
	pass

func p_update(_delta:float) -> void:
	pass

func p_physics_update(_delta:float) -> void:
	if RemoveShapesCount > 0:
		RemoveCount += GameMgr.p_remove_by_shape(GConstants.RemoveShapes[GConstants.RemoveShapes.size() - RemoveShapesCount])
		RemoveShapesCount -= 1
		return
	
	if RemoveCount > 0:
		Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Fill))
	else:
		Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Idle))

func _to_string() -> String:
	return GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Remove)
