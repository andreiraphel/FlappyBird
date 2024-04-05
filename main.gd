extends Node2D

var pipe = preload("res://pipenode.tscn")
var floor_asset = preload("res://floor.tscn")
var score = 0
var pipe_interval = 0
var floor_interval = 0
const FLOOR_INTERVAL = 2
const INTERVAL = 1.2
const RANGE = 128.0
var spawned_pipes = []
var i = 0

func player_score():
	if pipe._on_score_body_exited() == 1:
		score += 1
		print(score)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pipe_interval += delta
	floor_interval += delta
	
	if pipe_interval >= INTERVAL:
		spawn_pipe()
		pipe_interval = 0
	
	if floor_interval >= FLOOR_INTERVAL:
		spawn_floor()
		floor_interval = 0
		
	$HUD.update_score(i)

func spawn_pipe():
	var new_pipe = pipe.instantiate()
	add_child(new_pipe)
	
	new_pipe.position = Vector2(300,randf_range(RANGE,-RANGE))
	spawned_pipes.append(new_pipe)
	
func spawn_floor():
	var new_floor = floor_asset.instantiate()
	add_child(new_floor)
	
	new_floor.position = Vector2(770, 360)

func _on_area_2d_area_entered(area):
	spawned_pipes[i].queue_free()
	i += 1
