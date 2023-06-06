extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	pass
	

func _on_bt_start_pressed():
	get_tree().change_scene_to_file("res://src/Levels/Level.tscn")


func _on_bt_options_pressed():
	var options = load("res://src/Menus/Options.tscn").instance()
	get_tree().current_scene.add_child(options)

func _on_bt_quit_pressed():
	get_tree().quit()
