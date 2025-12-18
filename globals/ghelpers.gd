extends Node

func p_enum_to_string(enum_dict, value: int) -> String:
	#if value < 0 or value >= enum_dict.size():
		#return "UNKNOWN"
	return enum_dict.keys()[value]
