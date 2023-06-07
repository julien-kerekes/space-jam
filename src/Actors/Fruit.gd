extends Area2D
var speed := 2
var dt := 0.0
var texturePath

#@export var Enemy : PackedScene = preload("res://src/Actors/Enemy.tscn")
#@export var char : PackedScene = preload("res://src/Actors/characters_base.tscn")
#@export var player : PackedScene = preload("res://src/Actors/Player.tscn")
#@export var levels : PackedScene = preload("res://src/Levels/Level.tscn")
#@export var player : PackedScene = preload("res://src/Actors/Player.tscn")
var labelNode 
var fruitlabel


# different fruit textures
var textures = [
	"res://Assets/fruits/0000_Starberry.png",
	"res://Assets/fruits/0001_Meteorange.png",
	"res://Assets/fruits/0002_Galapple.png",
	"res://Assets/fruits/0003_Nebulime.png",
	"res://Assets/fruits/0004_Astroberry.png",
	"res://Assets/fruits/0005_Cometberry.png",
	"res://Assets/fruits/0006_Skyberry.png",
	"res://Assets/fruits/0007_Cosmango.png",
	"res://Assets/fruits/0008_Orbinana.png",
	"res://Assets/fruits/0010_Holeberry.png",
	"res://Assets/fruits/0011_Celestia.png",
	"res://Assets/fruits/0012_Lunaberry.png",
	"res://Assets/fruits/0013_Solarmelon.png"
]
# fruits assigned to textures
var powerups = {
	"res://Assets/fruits/0000_Starberry.png" : "Starberry",
	"res://Assets/fruits/0001_Meteorange.png" : "Meteorange",
	"res://Assets/fruits/0002_Galapple.png" : "Galapple",
	"res://Assets/fruits/0003_Nebulime.png" : "Nebulime",
	"res://Assets/fruits/0004_Astroberry.png" : "Astroberry",
	"res://Assets/fruits/0005_Cometberry.png" : "Cometberry",
	"res://Assets/fruits/0006_Skyberry.png" : "Skyberry",
	"res://Assets/fruits/0007_Cosmango.png" : "Cosmango",
	"res://Assets/fruits/0008_Orbinana.png" : "Orbinana",
	"res://Assets/fruits/0010_Holeberry.png" : "Holeberry",
	"res://Assets/fruits/0011_Celestia.png" : "Celestia",
	"res://Assets/fruits/0012_Lunaberry.png" : "Lunaberry",
	"res://Assets/fruits/0013_Solarmelon.png" : "Solarmelon"
}

func _process(delta):
	dt+=delta
	if dt >= 1.0/60: 
		dt = 0.0 
		position.y += speed

func _on_body_entered(body):
	if body.is_in_group("Player"):
		var powerup = powerups[texturePath]
		#print("powerup: "+powerup)
		#print("texturepath: "+texturePath)
		match (powerup):
			"Astroberry":
				GameManager.max_projectiles += 1
			"Celestia":
				$sfxExtraLife.play()
				$sfxExtraLife2D.play()
				if body.hp < 3:
					body.hp += 1
			"Cometberry":
				GameManager.score+=5
				$sfxExtraLife2D.play()
			"Cosmango":
				GameManager.speed+=50
			"Galapple": 
				$sfxExtraLife2D.play()
				GameManager.atkspeed += 2
			"Holeberry":
				body.scale *= 0.95				
			"Lunaberry":
				GameManager.enemyatkspeed *= 0.9
			"Meteorange":
				GameManager.atkspeed += 2
			"Nebulime":
				GameManager.enemyspeed *= 0.9
			"Orbinana":
				body.scale *= 0.95
			"Skyberry":
				GameManager.speed+=50
			"Solarmelon":
				#sun shield
				$sfxSunShield.play()
				pass
			"Starberry":
				GameManager.max_projectiles += 1
		print(powerup +" eingesammelt!")
		#fruitlabel.text = powerup +" eingesammelt!"
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _ready():
	#zufällige Frucht generieren
	#var labelNode = get_node("res://src/Levels/Level.tscn")
	#var Fruitlabel = labelNode.get_node("Fruitlabel")
	var textureIndex = randi() % textures.size()
	texturePath = textures[textureIndex]
	var texture = load(texturePath)
	$Sprite2D.texture = texture
	$sfxTakeBerry.play()
