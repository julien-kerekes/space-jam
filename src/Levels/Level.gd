extends Node2D

@export var Enemy : PackedScene = preload("res://src/Actors/Enemy.tscn")
@export var Fruit00 : PackedScene = preload("res://src/Actors/Fruit.tscn")
var enemy
var fruit
func _ready():
	$hpBar.max_value = $Player.hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ScoreLabel.text = str(GameManager.score)
	if($Player != null):
		$LifeLabel.text = str($Player.hp)
		$hpBar.value = $Player.hp
	else:
		$LifeLabel.text = "0"
	if(Input.is_action_just_pressed("spawn_enemy")):
		self.enemy = Enemy.instantiate()
		get_tree().current_scene.add_child(self.enemy)
		self.enemy.global_position = Vector2(randf_range(120,1030),120)
	if(Input.is_action_just_pressed("Spawn_powerup_00")):
		self.fruit = Fruit00.instantiate()
		get_tree().current_scene.add_child(self.fruit)
		self.fruit.global_position = Vector2(randf_range(20,1130),50)
