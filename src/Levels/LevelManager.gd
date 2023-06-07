extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$hpBar.max_value = $Player.hp
	$Player.hp = GameManager.player_hp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ScoreLabel.text = str(GameManager.score)
	if($Player != null):
		$LifeLabel.text = str($Player.hp)
		$hpBar.value = $Player.hp
	else:
		$LifeLabel.text = "0"
	
	if GameManager.kills == 1:
		GameManager.player_hp = $Player.hp
		get_tree().change_scene_to_file("res://src/Levels/Level2.tscn")
	elif GameManager.kills == 2:
		GameManager.player_hp = $Player.hp
		get_tree().change_scene_to_file("res://src/Levels/Level3.tscn")
	elif GameManager.kills == 5:
		GameManager.player_hp = $Player.hp
		get_tree().change_scene_to_file("res://src/Levels/EndlessLevel.tscn")
