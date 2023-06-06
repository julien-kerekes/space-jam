extends Area2D

var speed := 10
var direction := -1
var player
var dt := 0.0
var audio_player = AudioStreamPlayer2D.new()
var sound_path = "res://Assets/levels/projectile_hit.wav"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func dir(dir): #y:-1 = up 1 = down
	self.direction = dir

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dt+=delta
	if dt >= 1.0/60:
		dt = 0.0 
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
		#audio_player.stream = ResourceLoader.load(sound_path)
		#audio_player.play()
		#sfxProjectileHit
		$sfxBasicHit.play()
		destroy()
