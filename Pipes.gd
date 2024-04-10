extends StaticBody2D

var is_spawning = true
func _ready():
	pass # Replace with function body.

func _process(delta):
	if is_spawning:
		pipe_movement()

func _on_score_body_entered(body):
	if body.has_method("add_score"):
		body.add_score()

func _on_upper_body_entered(body):
	if body.has_method("died"):
		is_spawning = false
		stop_movement()
		body.died()

func _on_lower_body_entered(body):
	if body.has_method("died"):
		is_spawning = false
		stop_movement()
		body.died()


func pipe_movement():
	position += Vector2(-2,0)

func stop_movement():
	position = position
