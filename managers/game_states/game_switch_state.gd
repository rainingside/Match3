extends State
class_name GameSwitchState

func p_enter():
	pass

func p_exit():
	pass

func p_update(_delta:float):
	pass

func p_physics_update(_delta:float):
	pass

func _to_string() -> String:
	return GHelpers.p_enum_to_string(Enums.GameState, Enums.GameState.Switch)
