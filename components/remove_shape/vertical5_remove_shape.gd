extends IRemoveShape
class_name Vertical5RemoveShape

func _init() -> void:
	ShapeData = Array2D.new(5, 1)
	ShapeData.Data = [1, 
					  1, 
					  1, 
					  1, 
					  1]
	CenterIndex2d = Vector2i(2, 0)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
