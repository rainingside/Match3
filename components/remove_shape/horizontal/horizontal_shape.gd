extends IRemoveShape
class_name HorizontalShape

func _init() -> void:
	ShapeData2d = Array2D.new(1, 3)
	ShapeData2d.Data = [1, 1, 1]
	p_init_shape_data()
	CenterIndex2d = Vector2i(0, 1)
