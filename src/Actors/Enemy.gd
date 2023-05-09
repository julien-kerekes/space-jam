extends "res://src/Actors/characters_base.gd"

func _ready():
	$hpBar.max_value = self.hp

func _process(delta):
	super._process(delta)
	$hpBar.value = self.hp
	shoot(1)	

func _exit_tree(): 
	GameManager.score += 1
