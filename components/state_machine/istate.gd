extends Node
class_name IState

@warning_ignore("unused_signal")
signal Transitioned(state:IState, new_state_name:String)

func p_enter() -> void:
	pass

func p_exit() -> void:
	pass

func p_update(_delta:float) -> void:
	pass

func p_physics_update(_delta:float) -> void:
	pass
