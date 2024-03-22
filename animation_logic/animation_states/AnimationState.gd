extends AnimatedSprite2D

class_name AnimationState

enum STATES{
	LYING_IDLE1,
	LYING_IDLE2,
	STANDING_IDLE1,
	LYING_IDLE_TO_SLEEP
}

var legalEncounters = []

func _on_animation_looped():
	print("yap")
