extends CharacterBody2D


const WALK_SPEED:float = 200
const JUMP_FORCE:float = 380
const GRAVITY:float = 19.8

var is_idle:bool = true
var have_double_jumped:bool = false


@onready var animation := $AnimationPlayer as AnimationPlayer

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.velocity = Vector2()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	print(time)
	if position.y > 1152:
		get_tree().reload_current_scene()
		time = 0
	if !is_on_floor():
		velocity.y += GRAVITY
		time = 0
		if velocity.y > 0:
			animation.play('falling')
			
		if Input.is_action_just_pressed("ui_up") && !have_double_jumped:
			velocity.y = -JUMP_FORCE
			animation.play('jumping')
			have_double_jumped = true
	else:
		have_double_jumped = false
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -JUMP_FORCE
			animation.play('jumping')
			time = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
		animation.play('running')
		$Sprite2D.flip_h = false
		$CollisionPolygon2D.scale.x = 2
		time = 0
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = WALK_SPEED *-1
		animation.play('running')
		$Sprite2D.flip_h = true
		$CollisionPolygon2D.scale.x = -2
		time = 0
		
	else:
		velocity.x = 0
		if time > 5:
			animation.play('idle')
		else:
			animation.play('RESET')
	move_and_slide()
	
func handle_state()->void:
	var state:String = 'idle'
	match state:
		'idle':
			pass
		
	pass 
