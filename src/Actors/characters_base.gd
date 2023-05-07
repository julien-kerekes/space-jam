extends CharacterBody2D
@export var Projectile : PackedScene = preload("res://src/Actors/projectile.tscn")
@export var speed := 500.0
@export var hp := 3
var projectile

func _process(delta):
	if(self.hp == 0):
		queue_free()

func _on_hurtbox_area_entered(hitbox):
	print()
	if hitbox.is_in_group("Projectile"):
		self.hp -= 1
		if self.hp == 0:
			queue_free()

func shoot(dir):
	self.projectile = Projectile.instantiate()
	self.projectile.dir(dir)
	get_tree().current_scene.add_child(self.projectile)
	self.projectile.scale = self.scale
	self.projectile.global_position = Vector2(self.global_position.x,self.global_position.y-self.get_child(0).texture.get_size().y*(-dir)*self.scale.x)
