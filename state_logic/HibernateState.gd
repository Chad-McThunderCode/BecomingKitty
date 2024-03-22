class_name HibernateState
extends State

func _physics_process(delta):
	if(Input.is_anything_pressed()):
		print("wake up")
		state_machine.changeState(state_machine.idle_state)

func _state_entered():
	super._state_entered()
	animator.play("lying_idle_to_sleep", 1.0, false)

func pickAnimation():
	if not is_physics_processing():
		return

func _on_animation_looped():
	pickAnimation()
