extends Node

class MessageHandler:
	var Handler:Callable
	var Order:float
	
	func _init(handler: Callable, order: float) -> void:
		Handler = handler
		Order = order

## Dictionary[消息类名, array[MessageHandler]]
var MessageHandlers: Dictionary

func p_send(sender: Object, msg: IMessage) -> void:
	msg.Sender = sender
	msg.Timestamp = Time.get_unix_time_from_system() * 1000
	var msg_handlers: Array[MessageHandler] = MessageHandlers.get(
		msg.p_get_class_name(), [])
	for msg_handler: MessageHandler in msg_handlers:
		msg_handler.Handler.call(msg)

func p_subscribe(msg_type:Script, handler: Callable, order:int = 100) -> void:
	var key: String = msg_type.get_global_name()
	var msg_handlers: Array[MessageHandler] = MessageHandlers.get(key, [])
	var is_subscribe:bool = false
	for msg_handler: MessageHandler in msg_handlers:
		if msg_handler.Handler == handler:
			is_subscribe = true
			break
	if not is_subscribe:
		msg_handlers.append(MessageHandler.new(handler, order))
	msg_handlers.sort_custom(func(a:MessageHandler, b:MessageHandler) -> bool: return a.Order < b.Order)
	MessageHandlers[key] = msg_handlers

func p_unsubscribe(msg_type:Script, handler: Callable) -> void:
	var key: String = msg_type.get_global_name()
	var msg_handlers: Array[MessageHandler] = MessageHandlers.get(key, [])
	var remove_item:MessageHandler
	for msg_handler: MessageHandler in msg_handlers:
		if msg_handler.Handler == handler:
			remove_item = msg_handler
			break
	if remove_item:
		msg_handlers.erase(remove_item)
		if msg_handlers.size() > 0:
			MessageHandlers[key] = msg_handlers
		else :
			MessageHandlers.erase(key)
