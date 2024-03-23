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
		actor.velocity=Vector2(-10, 0)
	elif(Input.is_action_pressed("ui_right")):
		actor.velocity=Vector2(10, 0)
		animator.set_animation("walking")
		animator.flip_h=false
	else:
		state_machine.changeState(state_machine.idle_state)
		actor.velocity = Vector2.ZERO
	actor.move_and_collide(actor.velocity * delta)
