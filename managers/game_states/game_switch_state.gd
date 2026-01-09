extends IGameState
class_name GameSwitchState

func p_enter() -> void:
	pass

func p_exit() -> void:
	pass

func p_update(_delta:float) -> void:
	pass

func p_physics_update(_delta:float) -> void:
	if GameMgr.p_is_switch_end():
		if GameMgr.p_is_switch_have_special():
			Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.SwitchRemoveSpecial))
		else:
			Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.SwitchRemoveNormal))

func _to_string() -> String:
	return GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Switch)
