extends IRemoveShape
class_name Corner5LeftUpRemoveShape

func _init() -> void:
	ShapeData = Array2D.new(5, 5)
	ShapeData.Data = [0, 0, 0, 0, 1,
					  0, 0, 0, 0, 1,
					  0, 0, 0, 0, 1,
					  0, 0, 0, 0, 1,
					  1, 1, 1, 1, 1]
	CenterIndex2d = Vector2i(4, 4)
	BlockSpecialType = Enums.BlockSpecialTypes.Star
