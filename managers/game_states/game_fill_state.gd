extends State
class_name GameFillState

@export var GameMgr:GameManager

func p_enter():
	GameMgr.p_fill()

func p_exit():
	pass

func p_update(_delta:float):
	pass

func p_physics_update(_delta:float):
	if GameMgr.p_is_fill_end():
		Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameState, Enums.GameState.Remove))

func _to_string() -> String:
	return GHelpers.p_enum_to_string(Enums.GameState, Enums.GameState.Fill)
