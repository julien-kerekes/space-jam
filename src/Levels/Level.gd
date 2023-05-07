extends Node2D

@export var Enemy : PackedScene = preload("res://src/Actors/Enemy.tscn")
@export var Fruit00 : PackedScene = preload("res://src/Actors/Fruit.tscn")
var enemy
var fruit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ScoreLabel.text = str(GameManager.score)
	if($Player != null):
		$LifeLabel.text = str($Player.hp)
	else:
		$LifeLabel.text = "0"
	if(Input.is_action_just_pressed("spawn_enemy")):
		self.enemy = Enemy.instantiate()
		get_tree().current_scene.add_child(self.enemy)
		self.enemy.global_position = Vector2(500,50)
	if(Input.is_action_just_pressed("Spawn_powerup_00")):
		self.fruit = Fruit00.instantiate()
		get_tree().current_scene.add_child(self.fruit)
		self.fruit.global_position = Vector2(200,50)
