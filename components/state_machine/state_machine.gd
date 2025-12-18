extends Node
class_name StateMachine

@export var InitState:State

var CurrentState:State
var LastState:State
var States:Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			States[child.to_string()] = child
			child.Transitioned.connect(on_Transitioned)
	if InitState:
		InitState.p_enter()
		CurrentState = InitState

func _process(delta: float) -> void:
	if CurrentState:
		CurrentState.p_update(delta)

func _physics_process(delta: float) -> void:
	if CurrentState:
		CurrentState.p_physics_update(delta)

func on_Transitioned(state:State, new_state_name:String) -> void:
	if state != CurrentState:
		return
	var new_state:State = States.get(new_state_name)
	if !new_state:
		return
	if CurrentState:
		CurrentState.p_exit()
	new_state.p_enter()
	LastState = state
	CurrentState = new_state
