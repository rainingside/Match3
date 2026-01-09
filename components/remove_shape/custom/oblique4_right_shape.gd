extends IRemoveShape
class_name Oblique4RightShape

func _init() -> void:
	ShapeData2d = Array2D.new(4, 4)
	ShapeData2d.Data = [1, 0, 0, 0,
					  	0, 1, 0, 0,
					  	0, 0, 1, 0,
						0, 0, 0, 1]
	p_init_shape_data()
	CenterIndex2d = Vector2i(2, 2)
	BlockSpecialType = Enums.BlockSpecialTypes.ObliqueRight
