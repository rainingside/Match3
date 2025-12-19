extends Node

const BlockSize:int = 50

const SceneReses:Dictionary = {
	"Block": preload("uid://x028p8dtlvj0")
}

const BlockBgReses:Dictionary = {
	"Red": preload("uid://daroiuax7yorg"),
	"Yellow": preload("uid://ba8npr3h567sy"),
	"Green": preload("uid://gsx3c5g100vr"),
	"Blue": preload("uid://dkfnghahrge3i"),
	"Sky": preload("uid://dnxx2jbt42abx"),
	"Star": preload("uid://d2ggnuf2nf1p2"),
	"Bomb": preload("uid://b1vo41je3nu72"),
	"Horizontal": preload("uid://cdpmd2y52ekw3"),
	"Vertical": preload("uid://cu45ase2x6fgx")
}

var RemoveShapes:Array[IRemoveShape] = [
	Cross5RemoveShape.new(),
	Corner5LeftUpRemoveShape.new(),
	Corner5LeftDownRemoveShape.new(),
	Corner5RightUpRemoveShape.new(),
	Corner5RightDownRemoveShape.new(),
	Horizontal5RemoveShape.new(),
	Vertical5RemoveShape.new(),
	Horizontal4RemoveShape.new(),
	Vertical4RemoveShape.new(),
	Cross3RemoveShape.new(),
	HorizontalRemoveShape.new(),
	VerticalRemoveShape.new()
]
