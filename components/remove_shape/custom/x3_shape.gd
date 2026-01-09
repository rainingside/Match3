extends IRemoveShape
class_name X3Shape

func _init() -> void:
	ShapeData2d = Array2D.new(3, 3)
	ShapeData2d.Data = [1, 0, 1,
					  	0, 1, 0,
					  	1, 0, 1]
	p_init_shape_data()
	CenterIndex2d = Vector2i(1, 1)
	BlockSpecialType = Enums.BlockSpecialTypes.Bomb
