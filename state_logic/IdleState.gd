class_name IdleState
extends State

@export var hibernateTimeout : float

var idling = 0

func pickAnimation():
	if not is_physics_processing():
		return
	if("lying" in animator.animation):
		if(randf() < 0.5):
			animator.play("lying_idle2", 1.0, false)
		else:
			animator.play("lying_idle1", 1.0, false)
		if(randf() < 0.1):
			animator.play("idle1", 1.0, false)
	elif(randf() < 0.3):
		animator.play("idle_to_lying_idle", 1.0, false)
	if(idling > hibernateTimeout):
		if "lying" in animator.animation:
			state_machine.changeState(state_machine.hibernate_state)

func _physics_process(delta):
	idling+=delta
	if(Input.is_anything_pressed()):
		state_machine.changeState(state_machine.walking_state)

func _state_entered():
	super._state_entered()
	animator.play("idle1", 1.0, false)
	idling = 0

func _on_animation_looped():
	pickAnimation()

func _on_animation_finished():
	pickAnimation()
