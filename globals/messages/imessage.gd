extends RefCounted
class_name IMessage

var Sender: Object
var Timestamp: float

func p_get_class_name() -> String:
	return (IMessage as Script).get_global_name()

func _to_string() -> String:
	return "[%s], 发送者-[%s], 时间戳-[%.0f]" % [get_script().resource_path.get_file(), Sender.get_script().resource_path.get_file(), Timestamp]
