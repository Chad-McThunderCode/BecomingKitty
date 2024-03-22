class_name WalkingState
extends State

var idling = 0

func _physics_process(delta):
	idling = 0
	if(not Input.is_anything_pressed()):
		idling+=delta
	if(Input.is_action_pressed("ui_left")):
		animator.set_animation("walking")
		animator.flip_h = true
	elif(Input.is_action_pressed("ui_right")):
		animator.set_animation("walking")
		animator.flip_h=false
	else:
		state_machine.changeState(state_machine.idle_state)
