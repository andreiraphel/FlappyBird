extends Node2D

var pipe = preload("res://pipenode.tscn")
var floor_asset = preload("res://floor.tscn")

var pipe_interval = 0
const INTERVAL = 1.2
const RANGE = 128.0
var score = 0
var game_start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Floor/StaticBody2D/AnimationPlayer.stop()

func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		game_start = true
		
	if game_start:
		pipe_interval += delta
		$Floor/StaticBody2D/AnimationPlayer.play()
		$Player.play_game()
	
		if pipe_interval >= INTERVAL:
			spawn_pipe()
			pipe_interval = 0

func spawn_pipe():
	var new_pipe = pipe.instantiate()
	add_child(new_pipe)
	
	new_pipe.position = Vector2(300,randf_range(RANGE,-RANGE))
	

func _on_floor_coll_body_entered(body):
	if body.has_method("died"):
		body.died()
