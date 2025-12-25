extends IGameState
class_name GameIdleState

var IsDraging:bool

func p_enter():
	IsDraging = false

func p_exit():
	IsDraging = false

func p_update(_delta:float):
	pass

func p_physics_update(_delta:float):
	if IsDraging:
		if GameMgr.p_is_drag_ok():
			Transitioned.emit(self, GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Switch))
			return
		if Input.is_action_just_released("block_drag"):
			if !GameMgr.p_end_drag():
				IsDraging = false
		return
	if !IsDraging:
		if Input.is_action_just_pressed("block_drag"):
			IsDraging = GameMgr.p_start_drag()

func _to_string() -> String:
	return GHelpers.p_enum_to_string(Enums.GameStates, Enums.GameStates.Idle)
