class_name State
extends Node

@export var actor : Node2D
@export var animator : AnimatedSprite2D
@onready var state_machine = $".."

func _ready():
	set_physics_process(false)

func _state_entered():
	set_physics_process(true)
	
func _state_exited():
	set_physics_process(false)
