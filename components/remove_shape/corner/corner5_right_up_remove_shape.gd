extends IRemoveShape
class_name Corner5RightUpRemoveShape

func _init() -> void:
	ShapeData2d = Array2D.new(5, 5)
	ShapeData2d.Data = [1, 0, 0, 0, 0,
					  	1, 0, 0, 0, 0,
					  	1, 0, 0, 0, 0,
					  	1, 0, 0, 0, 0,
					  	1, 1, 1, 1, 1]
	p_init_shape_data()
	CenterIndex2d = Vector2i(4, 0)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
