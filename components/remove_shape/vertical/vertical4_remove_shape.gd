extends IRemoveShape
class_name Vertical4RemoveShape

func _init() -> void:
	ShapeData2d = Array2D.new(4, 1)
	ShapeData2d.Data = [1, 
					  	1, 
					  	1, 
					  	1]
	p_init_shape_data()
	CenterIndex2d = Vector2i(1, 0)
	BlockSpecialType = Enums.BlockSpecialTypes.Horizontal
