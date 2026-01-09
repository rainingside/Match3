extends IRemoveShape
class_name Oblique3LeftShape

func _init() -> void:
	ShapeData2d = Array2D.new(3, 3)
	ShapeData2d.Data = [0, 0, 1,
					  	0, 1, 0,
					  	1, 0, 0]
	p_init_shape_data()
	CenterIndex2d = Vector2i(1, 1)
