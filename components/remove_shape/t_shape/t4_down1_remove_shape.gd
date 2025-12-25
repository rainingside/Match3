extends IRemoveShape
class_name T4Down1RemoveShape

func _init() -> void:
	ShapeData2d = Array2D.new(3, 4)
	ShapeData2d.Data = [1, 1, 1, 1,
						0, 1, 0, 0,
						0, 1, 0, 0]
	p_init_shape_data()
	CenterIndex2d = Vector2i(0, 1)
	BlockSpecialType = Enums.BlockSpecialTypes.Bomb
