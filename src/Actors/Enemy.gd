extends "res://src/Actors/characters_base.gd"
var Jam : PackedScene = preload("res://src/Actors/Fruit.tscn")
var jam

func _ready():
	$hpBar.max_value = self.hp

func _process(delta):
	super._process(delta)
	$hpBar.value = self.hp
	shoot(1)	

func _exit_tree(): 
	var drop = randi_range(0,100)
	if drop < 10:
		self.jam = Jam.instantiate()
		get_tree().current_scene.add_child.call_deferred(self.jam)
		self.jam.global_position = Vector2(self.global_position.x ,self.global_position.y)
	GameManager.score += 1
