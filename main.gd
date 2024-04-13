extends Node2D

var pipe = preload("res://pipenode.tscn")
var floor_asset = preload("res://floor.tscn")
var hud = preload("res://hud.tscn")

var pipe_interval = 0
const INTERVAL = 1.2
const RANGE = 128.0
var game_start = false
var restart = false
var game_over = false
var spawned_pipes = []


func _ready():
	$floor/AnimationPlayer.stop()

func _process(delta):
	if Input.is_action_just_pressed("Jump"):
		game_start = true
		
	if game_start && $Player.is_alive:
		pipe_interval += delta
		$floor/AnimationPlayer.play()
		$Player.play_game()
	
		if pipe_interval >= INTERVAL:
			spawn_pipe()
			pipe_interval = 0
	
	if !$Player.is_alive:
		stop_pipes()
		$floor/AnimationPlayer.stop(false)
		$Player/HUD/Sprite2D.visible = true
		game_over = true
	
	if game_over:
		if Input.is_action_just_pressed("Jump"):
			reset_game()
			game_start = true
			game_over = false
			$Player/HUD/Sprite2D.visible = false
	

func spawn_pipe():
	var new_pipe = pipe.instantiate()
	add_child(new_pipe)
	new_pipe.position = Vector2(300,randf_range(RANGE,-RANGE))
	spawned_pipes.append(new_pipe)
	

func _on_floor_coll_body_entered(body):
	if body.has_method("died"):
		body.died()

func reset_game():
	# Reset variables
	pipe_interval = 0
	game_start = false
	
	$Player.reset()
	remove_all_pipes()

	if !$floor/AnimationPlayer.is_playing():
		$floor/AnimationPlayer.play()

func remove_all_pipes():
	print("Removing all pipes...")
	for pipe in spawned_pipes:
		print("Removing pipe")
		pipe.queue_free()  # Remove the pipe from the scene
	spawned_pipes.clear()  # Clear the array
	print("All pipes removed.")

func stop_pipes():
	for pipe in spawned_pipes:
		if pipe.has_method("stop_movement"):
			pipe.stop_movement()
