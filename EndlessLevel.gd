extends "res://src/Levels/Levels.gd"
var Enemy : PackedScene = preload("res://src/Actors/Enemy.tscn")
var enemy = null
var dir = 1
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
	#GameManager.enemyspeed = 0.1+0.05*GameManager.score
	#var move = GameManager.enemyspeed
	for en in get_children():
		if en.is_in_group("Enemy"):
			var movement = randi_range(0,2000)
			#print(movement)
			if movement>1999:
				#print("change dir!")
				dir = dir *-1
			#Force left move, if too far right
			if en.global_position[0]+150 > 1250:
				dir = -1
			#Force right move, if too far left
			elif en.global_position[0] < 50:
				dir = 1
			en.global_position = Vector2((en.global_position[0]+(GameManager.enemyspeed*dir)),120)
			#print(en.global_position[0])
