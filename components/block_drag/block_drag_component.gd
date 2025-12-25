extends Node
class_name BlockDragComponent

signal droped(drag_direction:Enums.BlockDragDirection)

@export var Target:Block

var IsDraging:bool = false

func p_start_drag() -> void:
	if IsDraging:
		return
	IsDraging = true

func p_end_drag() -> bool:
	if !IsDraging:
		return false
	var offset = Target.get_global_mouse_position() - Target.global_position
	if offset == Vector2.ZERO:
		IsDraging = false
		return false
		
	var offset_max:float = max(abs(offset.x), abs(offset.y))
	if offset_max < 10:
		IsDraging = false
		return false
	
	var dir:Enums.BlockDragDirection
	if offset.x > 0 and abs(offset.x) >= abs(offset.y):
		dir = Enums.BlockDragDirection.Right
	elif offset.x < 0 and abs(offset.x) >= abs(offset.y):
		dir = Enums.BlockDragDirection.Left
	elif offset.y > 0 and abs(offset.y) > abs(offset.x):
		dir = Enums.BlockDragDirection.Down
	else:
		dir = Enums.BlockDragDirection.Up
	droped.emit(dir)
	IsDraging = false
	return true
