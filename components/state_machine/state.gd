extends Node
class_name State

@warning_ignore("unused_signal")
signal Transitioned(state:State, new_state_name:String)

func p_enter():
	pass

func p_exit():
	pass

func p_update(_delta:float):
	pass

func p_physics_update(_delta:float):
	pass
