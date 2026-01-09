extends IGameState
class_name GameFillState

func p_enter() -> void:
	GameMgr.p_fill()

func p_exit() -> void:
	pass

func p_update(_delta:float) -> void:
	pass

func p_physics_update(_delta:float) -> void:
	if GameMgr.p_is_fill_end():
		Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Remove))

func _to_string() -> String:
	return GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Fill)
