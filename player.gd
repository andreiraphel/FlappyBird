extends CharacterBody2D


@export var speed = 300.0
@export var jump_velocity = -400.0

var gravity = 1000
var score = 0

func _physics_process(delta):
	$AnimatedSprite2D.play("fly")
	velocity.y += gravity * delta
	
	if velocity.y > 0:
		$AnimatedSprite2D.stop()
		if rotation_degrees < 90:
			rotate(0.05)
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_velocity
		if rotation_degrees > -40:
			set_rotation(-0.8)
	
	move_and_slide()

func add_score():
	score += 1
	$HUD.update_score(score)
