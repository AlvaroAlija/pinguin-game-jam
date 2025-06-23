extends Control

var short: float = 60.0
var normal: float = 120.0
var long: float = 180.0

func _on_play_pressed() -> void:
	Global.game_time = short
	get_tree().change_scene_to_file("res://scenes/map_menu.tscn")
	

func _on_play_2_pressed() -> void:
	Global.game_time = normal
	get_tree().change_scene_to_file("res://scenes/map_menu.tscn")


func _on_play_3_pressed() -> void:
	Global.game_time = long
	get_tree().change_scene_to_file("res://scenes/map_menu.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
