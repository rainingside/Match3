class_name Enums

enum BlockFlags {
	Normal,
	Special
}

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

enum GameStates {
	Fill,
	Remove,
	Idle,
	Switch,
	SwitchRemoveNormal,
	SwitchRemoveSpecial,
	SwitchCancel
}

enum RemoveSpecialTypes {
	Star,
	Bomb,
	Horizontal,
	Vertical,
	Stars,
	StartOther,
	Others
}
