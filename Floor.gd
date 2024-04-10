extends StaticBody2D

func _on_floor_coll_body_entered(body):
	if body.has_method("died"):
		body.died()
