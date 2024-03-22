extends AnimatedSprite2D

var idling = 4
var asleep = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(animation == "lying_idle_to_sleep" and frame == 3 and !is_playing()):
		asleep = true
		print("asleep", asleep)
	if(asleep):
		if(randf() < 1*delta):
			print("woke up")
			set_animation("lying_idle_to_sleep")
			play("lying_idle_to_sleep", 1.0, true)
			asleep = false
			

func _on_animation_looped():
	if("idle" in animation):
		idling += 1
		if(idling > 5):
			set_animation("lying_idle_to_sleep")
			idling = 0
		else:
			if("lying" in animation):
				if(randf() < 0.5):
					print("now lying_idle2")
					set_animation("lying_idle2")
				else:
					print("now lying_idle1")
					set_animation("lying_idle1")
