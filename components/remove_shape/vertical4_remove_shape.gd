extends IRemoveShape
class_name Vertical4RemoveShape

func _init() -> void:
	ShapeData = Array2D.new(4, 1)
	ShapeData.Data = [1, 
					  1, 
					  1, 
					  1]
	CenterIndex2d = Vector2i(1, 0)
	BlockSpecialType = Enums.BlockSpecialTypes.Vertical
