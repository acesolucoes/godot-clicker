extends Label

var LevelScene = preload("res://Scenes/levels/level_controller.tscn")

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			#get_tree().change_scene_to_packed(LevelScene)
			
			var level = LevelScene.instantiate()
			#level.characters_amount=20
			#add_child(level)
			get_tree().change_scene_to_node(level)
			
