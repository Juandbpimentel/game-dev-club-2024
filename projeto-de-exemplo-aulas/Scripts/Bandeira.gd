extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	
	if body.is_in_group('Player'):
		print(body,"Entrou")
		$Label.visible = true
	pass # Replace with function body.


func _on_body_exited(body):
	if body.is_in_group('Player'):
		print(body,"Saiu")
		$Label.visible = false
	pass # Replace with function body.