class_name Array2D

var Row:int = 1
var Column:int = 1
var Data:Array = []

func _init(row:int, column:int) -> void:
	Row = row
	Column = column
	Data.resize(Row * Column)

func p_set(row:int, column:int, value:Variant) -> void:
	Data[row * Column + column] = value

func p_get(row:int, column:int) -> Variant:
	return Data[row * Column + column]
