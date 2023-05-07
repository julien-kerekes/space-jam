extends CharacterBody2D
@export var Projectile : PackedScene = preload("res://src/Actors/projectile.tscn")
@export var speed := 500.0
@export var hp := 3
@export var max_projectiles := 1
var active_projectiles := 0
var projectile

func _process(delta):
	if(self.hp == 0):
		queue_free()

func shoot(dir):
	if(self.active_projectiles < self.max_projectiles):
		self.projectile = Projectile.instantiate()
		self.projectile.dir(dir)
		self.projectile.player = self
		self.projectile.scale = self.scale
		self.projectile.global_position = Vector2(self.global_position.x ,self.global_position.y-self.get_child(0).texture.get_size().y*(-dir)*self.scale.y*self.get_child(0).scale.y)
		get_tree().current_scene.add_child(self.projectile)
		self.active_projectiles += 1
