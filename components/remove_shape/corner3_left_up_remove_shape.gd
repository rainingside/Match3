extends IRemoveShape
class_name Corner3LeftUpRemoveShape

func _init() -> void:
	ShapeData = Array2D.new(3, 3)
	ShapeData.Data = [0, 0, 1,
					  0, 0, 1,
					  1, 1, 1]
	CenterIndex2d = Vector2i(2, 2)
