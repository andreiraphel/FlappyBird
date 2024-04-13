extends CharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -400.0

var gravity = 1300
var score = 0
var is_alive = true
var start = false
var final_score = 0

func _physics_process(delta):
	
				
	if is_alive && start:
		play_game()
		$HUD/Score.visible = true
		$HUD/StartUI.visible = false
		$AnimatedSprite2D.play("fly")
		velocity.y += gravity * delta
		if velocity.y > 0:
			$AnimatedSprite2D.stop()
			if rotation_degrees < 90:
				rotate(0.05)
		
		# Handle jump.
		if Input.is_action_just_pressed("Jump"):
			velocity.y = jump_velocity
			$flap.play()
			if rotation_degrees > -40:
				set_rotation(-0.8)
		move_and_slide()
	else:
		$HUD/Score.visible = false
		

func add_score():
	score += 1
	$HUD.update_score(score)

func died():
	$hit.play()
	is_alive = false
	start = false
	$HUD.final_score()
	$HUD/FinalScore.visible = true
	$AnimatedSprite2D.stop()

func play_game():
	start = true
	
func reset():
	score = 0
	is_alive = true
	start = false
	final_score = 0
	velocity = Vector2.ZERO
	set_position(Vector2.ZERO)
	set_rotation(0)
	$HUD.update_score(score)
	$HUD.final_score()
	$HUD/FinalScore.visible = false
