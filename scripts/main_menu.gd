extends Control



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/time_menu.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")


func _on_lore_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lore_tut.tscn")


func _on_laderb_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")
