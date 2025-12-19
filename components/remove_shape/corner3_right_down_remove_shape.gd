extends IRemoveShape
class_name Corner3RightDownRemoveShape

func _init() -> void:
	ShapeData = Array2D.new(3, 3)
	ShapeData.Data = [1, 1, 1,
					  1, 0, 0,
					  1, 0, 0]
	CenterIndex2d = Vector2i(0, 0)
