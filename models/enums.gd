class_name Enums



enum BlockTypes {
	Red,
	Green,
	Yellow,
	Blue,
	Sky
}

enum BlockSpecialTypes {
	Star,
	Bomb,
	Horizontal,
	Vertical
}

enum BlockDragDirection {
	Up,
	Down,
	Left,
	Right
}

enum GameState {
	Fill,
	Remove,
	Idle,
	Switch,
	SwitchCancel
}
