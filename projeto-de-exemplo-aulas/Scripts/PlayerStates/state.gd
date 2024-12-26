extends Node2D

class_name State

var change_state: Callable
var sprite: Sprite2D
var animation_player: AnimationPlayer
var persistent_state: PersistentState
var velocity = 0

# Writing _delta instead of delta here prevents the unused variable warning.
func _physics_process(_delta):
	persistent_state.move_and_slide(persistent_state.velocity, Vector2.UP)

func setup(change_state, sprite, animation_player, persistent_state):
	self.change_state = change_state
	self.sprite = sprite
	self.persistent_state = persistent_state
	self.animation_player = animation_player

func move_left():
	pass

func move_right():
	pass
