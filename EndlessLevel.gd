extends "res://src/Levels/Levels.gd"
var Enemy : PackedScene = preload("res://src/Actors/Enemy.tscn")
var enemy = null

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
	if len(get_tree().get_nodes_in_group("Enemy")) < 3:
		var enemiepositions = []
		for en in get_children():
			if en.is_in_group("Enemy"):
				enemiepositions.append(en.global_position)
		var posx = 0
		while true: #preventing enemies from spawning in another enemy
			var collide = false
			posx = randi_range(120,1100)
			for pos in enemiepositions:
				if posx > pos[0] - 150 && posx < pos[0] + 150:
					collide = true
			if collide == false:
				break
		self.enemy = Enemy.instantiate()
		get_tree().current_scene.add_child(self.enemy)
		self.enemy.global_position = Vector2(posx,120)	
