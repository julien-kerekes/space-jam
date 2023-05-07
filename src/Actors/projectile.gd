extends Area2D

var speed := 4
var direction := -1
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func dir(dir): #y:-1 = up 1 = down
	self.direction = dir

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed*self.direction

func destroy():
	if player != null:
		player.active_projectiles -= 1
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	destroy()

func _on_body_entered(body):
	if body.is_in_group("Characters"):
		body.hp -= 1
		destroy()
