extends CharacterBody2D


@export var speed = 300.0
@export var jump_velocity = -400.0

var gravity = 5

func _physics_process(delta):
	$AnimatedSprite2D.play("fly")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta * speed
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_velocity
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	move_and_slide()
