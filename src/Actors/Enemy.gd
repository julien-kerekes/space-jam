extends "res://src/Actors/characters_base.gd"

func _process(delta):
	super._process(delta)
	shoot(1)	

func _exit_tree(): 
	GameManager.score += 1
