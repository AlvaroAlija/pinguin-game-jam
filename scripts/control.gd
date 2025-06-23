extends Control

@onready var score_list = $ScoreList

func _ready():
	ScoreManager.load_scores()
	for score in ScoreManager.scores:
		var label = Label.new()
		label.text = str(score) + " kg"
		score_list.add_child(label)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
