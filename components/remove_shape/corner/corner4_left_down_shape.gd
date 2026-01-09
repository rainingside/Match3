extends IRemoveShape
class_name Corner4LeftDownShape

func _init() -> void:
	ShapeData2d = Array2D.new(4, 4)
	ShapeData2d.Data = [0, 0, 1, 0,
						1, 1, 1, 1,
						0, 0, 1, 0,
						0, 0, 1, 0]
	p_init_shape_data()
	CenterIndex2d = Vector2i(1, 2)
	BlockSpecialType = Enums.BlockSpecialTypes.Bomb
	
