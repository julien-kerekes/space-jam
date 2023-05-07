extends Area2D
var speed := 2

func _process(delta):
	position.y += speed

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.scale *= 0.95
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
