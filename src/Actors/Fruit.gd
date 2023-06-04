extends Area2D
var speed := 2
var dt := 0.0

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
