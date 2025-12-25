extends Node

const BlockSize:int = 50
const Vector2iNull:Vector2i = Vector2i(-1, -1)

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
	Corner4LeftDownRemoveShape.new(),
	Corner4LeftUpRemoveShape.new(),
	Corner4RightDownRemoveShape.new(),
	Corner4RightUpRemoveShape.new(),
	T4Left1RemoveShape.new(),
	T4Left2RemoveShape.new(),
	T4Right1RemoveShape.new(),
	T4Right2RemoveShape.new(),
	T4Up1RemoveShape.new(),
	T4Up2RemoveShape.new(),
	T4Down1RemoveShape.new(),
	T4Down2RemoveShape.new(),
	Horizontal4RemoveShape.new(),
	Vertical4RemoveShape.new(),
	Cross3RemoveShape.new(),
	Corner3LeftDownRemoveShape.new(),
	Corner3LeftUpRemoveShape.new(),
	Corner3RightUpRemoveShape.new(),
	Corner3RightDownRemoveShape.new(),
	T3LeftRemoveShape.new(),
	T3RightRemoveShape.new(),
	T3UpRemoveShape.new(),
	T3DownRemoveShape.new(),
	HorizontalRemoveShape.new(),
	VerticalRemoveShape.new()
]
