extends CharacterBody2D


@export var speed = 300.0
@export var jump_velocity = -400.0

var gravity = 1000

func _physics_process(delta):
	$AnimatedSprite2D.play("fly")
	velocity.y += gravity * delta
	
	# Add the gravity.
	if velocity.y > 0:
		$AnimatedSprite2D.stop()
		if rotation_degrees < 90:
			rotate(0.05)
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_velocity
		if rotation_degrees > -40:
			rotate(-1.5)
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	move_and_slide()
