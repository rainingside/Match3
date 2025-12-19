extends IRemoveShape
class_name Cross3RemoveShape

func _init() -> void:
	ShapeData = Array2D.new(3, 3)
	ShapeData.Data = [0, 1, 0,
					  1, 1, 1,
					  0, 1, 0]
	CenterIndex2d = Vector2i(1, 1)
	BlockSpecialType = Enums.BlockSpecialTypes.Bomb
