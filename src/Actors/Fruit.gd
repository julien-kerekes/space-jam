extends Area2D
var speed := 2
var dt := 0.0

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
		if body.hp < 3:
			body.hp += 1
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _ready():
	#zufällige Frucht generieren
	var textureIndex = randi() % textures.size()
	var texturePath = textures[textureIndex]
	var texture = load(texturePath)
	$Sprite2D.texture = texture
	
	pass # Replace with function body.
