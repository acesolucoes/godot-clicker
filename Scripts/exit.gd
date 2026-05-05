extends Label

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			get_tree().quit()
