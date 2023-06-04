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
		get_tree().change_scene_to_file("res://src/Menus/Game_Over.tscn")

func save_player_hp():
	GameManager.player_hp = $Player.hp
