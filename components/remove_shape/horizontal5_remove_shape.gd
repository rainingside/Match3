extends IRemoveShape
class_name Horizontal5RemoveShape

func _init() -> void:
	ShapeData = Array2D.new(1, 5)
	ShapeData.Data = [1, 1, 1, 1, 1]
	CenterIndex2d = Vector2i(0, 2)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
	
