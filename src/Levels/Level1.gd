extends "res://src/Levels/Levels.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
	if GameManager.score == 1:
		save_player_hp()
		get_tree().change_scene_to_file("res://src/Levels/Level2.tscn")
