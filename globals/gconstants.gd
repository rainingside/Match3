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
	"Vertical": preload("uid://cu45ase2x6fgx"),
	"ObliqueLeft": preload("uid://ddthbwx5uxy17"),
	"ObliqueRight": preload("uid://cp536pc3m0wlr")
}

var RemoveShapes:Array[IRemoveShape] = [
	Cross5Shape.new(),
	Corner5LeftUpShape.new(),
	Corner5LeftDownShape.new(),
	Corner5RightUpShape.new(),
	Corner5RightDownShape.new(),
	Horizontal5Shape.new(),
	Vertical5Shape.new(),
	
	Oblique4LeftShape.new(),
	Oblique4RightShape.new(),
	
	Corner4LeftDownShape.new(),
	Corner4LeftUpShape.new(),
	Corner4RightDownShape.new(),
	Corner4RightUpShape.new(),
	T4Left1Shape.new(),
	T4Left2Shape.new(),
	T4Right1Shape.new(),
	T4Right2Shape.new(),
	T4Up1Shape.new(),
	T4Up2Shape.new(),
	T4Down1Shape.new(),
	T4Down2Shape.new(),
	Horizontal4Shape.new(),
	Vertical4Shape.new(),
	Cross3Shape.new(),
	Corner3LeftDownShape.new(),
	Corner3LeftUpShape.new(),
	Corner3RightUpShape.new(),
	Corner3RightDownShape.new(),
	T3LeftShape.new(),
	T3RightShape.new(),
	T3UpShape.new(),
	T3DownShape.new(),
	HorizontalShape.new(),
	VerticalShape.new()
]
