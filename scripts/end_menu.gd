extends Control

@onready var delivered_label = $VBoxContainer/Label2
@onready var more_eggs_label = $Label2

func _ready():
	var total_kg = Global.total_delivered_weight
	delivered_label.text = "You delivered " + str(total_kg) + " kg of eggs!"
	more_eggs_label.text = "Do you think you could deliver " + str(total_kg + 10) + " kg of eggs?"
	ScoreManager.add_score(total_kg)



func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/time_menu.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
