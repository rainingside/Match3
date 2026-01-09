extends IGameState
class_name GameSwitchCancelState

func p_enter() -> void:
	GameMgr.p_switch_cancel()

func p_exit() -> void:
	GameMgr.p_switch_cancel_end()

func p_update(_delta:float) -> void:
	pass

func p_physics_update(_delta:float) -> void:
	if GameMgr.p_is_switch_cancel_end():
		Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Idle))
	
func _to_string() -> String:
	return GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.SwitchCancel)
