extends "res://src/Actors/characters_base.gd"

func _process(delta):
	super._process(delta)
	if(null == projectile): #shooting as soon as old projectile disappears
		shoot(1)	

func _exit_tree(): 
	GameManager.score += 1
