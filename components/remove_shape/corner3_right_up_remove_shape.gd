extends IRemoveShape
class_name Corner3RightUpRemoveShape

func _init() -> void:
	ShapeData = Array2D.new(3, 3)
	ShapeData.Data = [1, 0, 0,
					  1, 0, 0,
					  1, 1, 1]
	CenterIndex2d = Vector2i(2, 0)
