extends Control



func _on_play_pressed():
	GameSettings.current_mode = GameSettings.GameMode.ONE_PLAYER
	get_tree().change_scene_to_file("res://Scenes/world_scene.tscn")
	


func _on_quit_pressed():
	get_tree().quit()


func _on__player_pressed():
	GameSettings.current_mode = GameSettings.GameMode.TWO_PLAYER
	get_tree().change_scene_to_file("res://Scenes/world_scene.tscn")
