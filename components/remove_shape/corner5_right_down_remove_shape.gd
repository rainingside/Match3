extends IRemoveShape
class_name Corner5RightDownRemoveShape

func _init() -> void:
	ShapeData = Array2D.new(5, 5)
	ShapeData.Data = [1, 1, 1, 1, 1,
					  1, 0, 0, 0, 0,
					  1, 0, 0, 0, 0,
					  1, 0, 0, 0, 0,
					  1, 0, 0, 0, 0]
	CenterIndex2d = Vector2i(0, 0)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
