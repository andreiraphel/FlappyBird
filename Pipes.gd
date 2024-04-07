extends StaticBody2D

var is_moving = false
func _ready():
	pass # Replace with function body.

func _process(delta):
	position += Vector2(-2,0)

func _on_score_body_entered(body):
	if body.has_method("add_score"):
		body.add_score()

func _on_upper_body_entered(body):
	if body.has_method("died"):
		body.died()

func _on_lower_body_entered(body):
	if body.has_method("died"):
		body.died()

func start_pipe():
	is_moving = true
