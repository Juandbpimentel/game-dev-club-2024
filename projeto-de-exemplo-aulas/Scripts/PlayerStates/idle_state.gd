extends State

class_name IdleState

func _ready():
	animation_player.play("idle")

func _flip_direction():
	sprite.flip_h = not sprite.flip_h

func move_left():
	if sprite.flip_h:
		change_state.call_func("run")
	else:
		_flip_direction()

func move_right():
	if not animated_sprite.flip_h:
		change_state.call_func("run")
	else:
		_flip_direction()
