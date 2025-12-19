extends IRemoveShape
class_name Cross5RemoveShape

func _init() -> void:
	ShapeData = Array2D.new(5, 5)
	ShapeData.Data = [0, 0, 1, 0, 0,
					  0, 0, 1, 0, 0,
					  1, 1, 1, 1, 1,
					  0, 0, 1, 0, 0,
					  0, 0, 1, 0, 0]
	CenterIndex2d = Vector2i(2, 2)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
