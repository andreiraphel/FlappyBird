extends Node2D

var pipe = preload("res://pipenode.tscn")
var floor_asset = preload("res://floor.tscn")

var pipe_interval = 0
const INTERVAL = 1.2
const RANGE = 128.0
var spawned_pipes = []
var i = 0
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pipe_interval += delta
	
	if pipe_interval >= INTERVAL:
		spawn_pipe()
		pipe_interval = 0
	
		
func spawn_pipe():
	var new_pipe = pipe.instantiate()
	add_child(new_pipe)
	
	new_pipe.position = Vector2(300,randf_range(RANGE,-RANGE))
	spawned_pipes.append(new_pipe)
	
func _on_area_2d_area_entered(area):
	spawned_pipes[i].queue_free()
	i += 1
