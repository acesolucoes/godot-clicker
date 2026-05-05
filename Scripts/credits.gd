extends Label

var creditScene = preload("res://Scenes/credits/credits.tscn")

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			get_tree().change_scene_to_packed(creditScene)
