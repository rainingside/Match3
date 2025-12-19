extends IRemoveShape
class_name Horizontal4RemoveShape

func _init() -> void:
	ShapeData = Array2D.new(1, 4)
	ShapeData.Data = [1, 1, 1, 1]
	CenterIndex2d = Vector2i(0, 1)
	BlockSpecialType = Enums.BlockSpecialTypes.Horizontal
