extends Resource
class_name StepData

var Steps:int = 1

func _init(steps:int) -> void:
	Steps = steps

func p_go_next() -> void:
	Steps += 1

func p_rollback() -> void:
	Steps -= 1

func p_reset() -> void:
	Steps = 1
