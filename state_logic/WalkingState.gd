class_name WalkingState
extends State

var idling = 0
var entered = 0
var speed = 1

func _physics_process(delta):
	entered+=delta
	idling = 0
	if(not Input.is_anything_pressed()):
		idling+=delta
	if(entered < 0.2 and (Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"))):
		speed = 12
		animator.set_animation("running")
	if(Input.is_action_pressed("ui_left")):
		animator.flip_h = true
		actor.velocity=Vector2(-10*speed, 0)
	elif(Input.is_action_pressed("ui_right")):
		actor.velocity=Vector2(10*speed, 0)
		animator.flip_h=false
	elif(entered>0.2):
		state_machine.changeState(state_machine.idle_state)
		actor.velocity = Vector2.ZERO
	actor.move_and_collide(actor.velocity * delta)

func _state_entered():
	super._state_entered()
	animator.set_animation("walking")
	entered = 0
	speed = 2
