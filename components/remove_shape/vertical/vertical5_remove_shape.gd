extends IRemoveShape
class_name Vertical5RemoveShape

func _init() -> void:
	ShapeData2d = Array2D.new(5, 1)
	ShapeData2d.Data = [1, 
					  	1, 
					  	1, 
					  	1, 
					  	1]
	p_init_shape_data()
	CenterIndex2d = Vector2i(2, 0)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
