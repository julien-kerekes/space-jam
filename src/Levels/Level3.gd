extends "res://src/Levels/Levels.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
	if GameManager.score == 5:
		save_player_hp()
		#$sfxCountdown.play()
		#await $sfxCountdown.play().completed
		#await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://src/Levels/EndlessLevel.tscn")
