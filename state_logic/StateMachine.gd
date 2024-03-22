class_name StateMachine
extends Node

@export var state: State
@onready var idle_state = $IdleState
@onready var hibernate_state = $HibernateState
@onready var walking_state = $WalkingState

func _ready():
	state._state_entered()

func changeState(new_state):
	print(randf(), "old state ", state)
	state._state_exited()
	state = new_state
	state._state_entered()
	print("new state ", state)
