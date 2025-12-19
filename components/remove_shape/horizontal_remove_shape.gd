extends IRemoveShape
class_name HorizontalRemoveShape

func _init() -> void:
	ShapeData = Array2D.new(1, 3)
	ShapeData.Data = [1, 1, 1]
	CenterIndex2d = Vector2i(0, 1)
