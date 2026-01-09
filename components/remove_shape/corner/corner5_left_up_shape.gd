extends IRemoveShape
class_name Corner5LeftUpShape

func _init() -> void:
	ShapeData2d = Array2D.new(5, 5)
	ShapeData2d.Data = [0, 0, 0, 0, 1,
					  	0, 0, 0, 0, 1,
					  	0, 0, 0, 0, 1,
					  	0, 0, 0, 0, 1,
					  	1, 1, 1, 1, 1]
	p_init_shape_data()
	CenterIndex2d = Vector2i(4, 4)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
