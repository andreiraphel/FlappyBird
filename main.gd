extends Node2D

var pipe = preload("res://pipenode.tscn")
var floor_asset = preload("res://floor.tscn")

var pipe_interval = 0
const INTERVAL = 1.2
const RANGE = 128.0
var score = 0
var game_start = false
var main_game_over = false


func _ready():
	$floor/AnimationPlayer.stop()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		game_start = true
		
	if game_start && $Player.is_alive:
		pipe_interval += delta
		$floor/AnimationPlayer.play()
		$Player.play_game()
	
		if pipe_interval >= INTERVAL:
			spawn_pipe()
			pipe_interval = 0
	
	if !$Player.is_alive:
		$floor/AnimationPlayer.pause()
	

func spawn_pipe():
	var new_pipe = pipe.instantiate()
	add_child(new_pipe)
	
	new_pipe.position = Vector2(300,randf_range(RANGE,-RANGE))
	

func _on_floor_coll_body_entered(body):
	if body.has_method("died"):
		body.died()
