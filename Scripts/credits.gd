extends Label

var level2 = preload("res://Scenes/level.tscn")

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			get_tree().change_scene_to_packed(level2)
