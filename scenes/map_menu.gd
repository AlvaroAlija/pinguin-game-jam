extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_play_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_2.tscn")


func _on_play_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_3.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/time_menu.tscn")
