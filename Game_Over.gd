extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text += "\rYour Points: "+str(GameManager.score)
	#self.text += "\rThank you for\nyour attention!"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
