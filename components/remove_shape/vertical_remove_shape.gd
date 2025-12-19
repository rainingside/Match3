extends IRemoveShape
class_name VerticalRemoveShape

func _init() -> void:
	ShapeData = Array2D.new(3, 1)
	ShapeData.Data = [1,
					  1, 
					  1]
	CenterIndex2d = Vector2i(1, 0)
