extends Node
class_name BlockDragComponent

signal droped(drag_direction:Enums.BlockDragDirection)

@export var Target:Block

var IsDraging:bool = false

var m_drag_timer:Timer

func _ready() -> void:
	m_drag_timer = Timer.new()
	m_drag_timer.one_shot = true
	m_drag_timer.autostart = false
	m_drag_timer.wait_time = 0.5
	add_child(m_drag_timer)
	m_drag_timer.timeout.connect(on_drag_timer_timeout)

func p_start_drag() -> void:
	if IsDraging:
		return
	IsDraging = true
	m_drag_timer.start()

func end_drag() -> void:
	IsDraging = false
	
func on_drag_timer_timeout() -> void:
	var offset = (Target.get_global_mouse_position() - Target.global_position).normalized()
	if offset == Vector2.ZERO:
		end_drag()
		return
	
	var dir:Enums.BlockDragDirection
	if offset.x > 0 and abs(offset.x) >= abs(offset.y):
		dir = Enums.BlockDragDirection.Right
	elif offset.x < 0 and abs(offset.x) >= abs(offset.y):
		dir = Enums.BlockDragDirection.Left
	elif offset.y > 0 and abs(offset.y) > abs(offset.x):
		dir = Enums.BlockDragDirection.Down
	else:
		dir = Enums.BlockDragDirection.Up
	end_drag()
	droped.emit(dir)
	
