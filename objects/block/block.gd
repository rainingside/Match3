extends Node2D
class_name Block

signal droped(block: Block, drag_direction:Enums.BlockDragDirection)

@export var Data:IBlockData
var Speed:int = 200
var MaxSpeed:int = 600
var acceleration:int = 150
var CurrentSpeed:int = Speed

@onready var m_sprite_2d: Sprite2D = $Sprite2D
@onready var m_block_drag_component: BlockDragComponent = $BlockDragComponent

func p_init(data:IBlockData) -> void:
	Data = data

func _ready() -> void:
	if Data is NormalBlockData:
		m_sprite_2d.texture = GConstants.BlockBgReses[GHelpers.p_enum_to_string(Enums.BlockTypes, Data.BlockType)]
	elif Data is SpecialBlockData:
		m_sprite_2d.texture = GConstants.BlockBgReses[GHelpers.p_enum_to_string(Enums.BlockSpecialTypes, Data.SpecialType)]
	m_block_drag_component.droped.connect(on_droped)

func _physics_process(delta: float) -> void:
	var dir:Vector2 = (Data.TargetGPosition - global_position).normalized()
	if dir == Vector2.ZERO:
		CurrentSpeed = Speed
		return
	
	if m_block_drag_component.IsDraging:
		CurrentSpeed = Speed
	else :
		CurrentSpeed = CurrentSpeed + acceleration * delta
		CurrentSpeed = clampi(CurrentSpeed, Speed, MaxSpeed)
	
	var x = global_position.x + CurrentSpeed * dir.x * delta
	var y = global_position.y + CurrentSpeed * dir.y * delta
	if dir.x > 0 && x > Data.TargetGPosition.x:
		x = Data.TargetGPosition.x
	if dir.x < 0 && x < Data.TargetGPosition.x:
		x = Data.TargetGPosition.x
	if dir.y > 0 && y > Data.TargetGPosition.y:
		y = Data.TargetGPosition.y
	if dir.y < 0 && y < Data.TargetGPosition.y:
		y = Data.TargetGPosition.y
	global_position = Vector2(x, y)

func p_start_drag() -> void:
	m_block_drag_component.p_start_drag()

func p_end_drag() -> bool:
	return m_block_drag_component.p_end_drag()

func on_droped(drag_direction:Enums.BlockDragDirection) -> void:
	droped.emit(self, drag_direction)

func p_is_move_end() -> bool:
	if global_position == Data.TargetGPosition:
		return true
	return false
