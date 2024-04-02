extends Node2D

var pipe = preload("res://pipenode.tscn")

var pipe_interval = 0
const INTERVAL = 1.2
const RANGE = 128.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
	

func delete_pipe(body):
	if body.has_method("queue_free"):
		body.queue_free()
		pipe.erase(pipe.find(body))
