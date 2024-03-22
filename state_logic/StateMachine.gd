class_name StateMachine
extends Node

@export var state: State
@onready var idle_state = $IdleState
@onready var hibernate_state = $HibernateState

func _ready():
	state._state_entered()

func changeState(new_state):
	state._state_exited()
	state = new_state
	state._state_entered()
