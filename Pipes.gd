extends StaticBody2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	position += Vector2(-2,0)

func _on_score_body_exited(body):
	print(1)
