extends IRemoveShape
class_name Cross5RemoveShape

func _init() -> void:
	ShapeData2d = Array2D.new(5, 5)
	ShapeData2d.Data = [0, 0, 1, 0, 0,
					  	0, 0, 1, 0, 0,
					  	1, 1, 1, 1, 1,
					  	0, 0, 1, 0, 0,
					  	0, 0, 1, 0, 0]
	p_init_shape_data()
	CenterIndex2d = Vector2i(2, 2)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
