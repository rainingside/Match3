extends IRemoveShape
class_name Corner5LeftDownRemoveShape

func _init() -> void:
	ShapeData = Array2D.new(5, 5)
	ShapeData.Data = [1, 1, 1, 1, 1,
					  0, 0, 0, 0, 1,
					  0, 0, 0, 0, 1,
					  0, 0, 0, 0, 1,
					  0, 0, 0, 0, 1]
	CenterIndex2d = Vector2i(0, 4)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
