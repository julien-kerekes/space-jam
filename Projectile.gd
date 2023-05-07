extends Node2D

@export var size := 100
@export var speed := -1

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(500,500)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_y(speed)

func init(pos:Vector2):
	position = pos
