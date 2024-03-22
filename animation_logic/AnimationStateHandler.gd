extends Object

class_name AnimationStateHandler

func request_animation_state(identifier):
	match identifier:
		AnimationState.STATES.LYING_IDLE1:
			return LyingIdle1.new()
		AnimationState.STATES.LYING_IDLE2:
			return LyingIdle2.new()
		AnimationState.STATES.STANDING_IDLE1:
			return StandingIdle1.new()
		AnimationState.STATES.LYING_IDLE_TO_SLEEP:
			return LyingIdleToSleep.new()
