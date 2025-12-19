extends Node2D
class_name Block

signal droped(block: Block, drag_direction:Enums.BlockDragDirection)

@export var Data:BlockData
var Speed:int = 200

@onready var m_sprite_2d: Sprite2D = $Sprite2D
@onready var m_block_drag_component: BlockDragComponent = $BlockDragComponent

func p_init(data:BlockData) -> void:
	Data = data

func _ready() -> void:
	if Data.BlockFlag == Enums.BlockFlags.Normal:
		m_sprite_2d.texture = GConstants.BlockBgReses[GHelpers.p_enum_to_string(Enums.BlockTypes, Data.BlockType)]
	else:
		m_sprite_2d.texture = GConstants.BlockBgReses[GHelpers.p_enum_to_string(Enums.BlockSpecialTypes, Data.BlockSpecialType)]
	m_block_drag_component.droped.connect(on_droped)

func _physics_process(delta: float) -> void:
	var dir:Vector2 = (Data.TargetGPosition - global_position).normalized()
	if dir == Vector2.ZERO:
		return
	var y = global_position.y + Speed * dir.y * delta;
	if dir.y > 0 and y > Data.TargetGPosition.y:
		y = Data.TargetGPosition.y
	elif dir.y < 0 and y < Data.TargetGPosition.y:
		y = Data.TargetGPosition.y
	global_position.y = y

func p_start_drag() -> void:
	m_block_drag_component.p_start_drag()

func on_droped(drag_direction:Enums.BlockDragDirection) -> void:
	droped.emit(self, drag_direction)
