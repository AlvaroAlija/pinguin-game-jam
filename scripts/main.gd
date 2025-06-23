extends Node2D

@onready var game_timer = $GameTimer
@onready var time_label = $Camera2D/timeLabel2

@export var time_left: float = 60.0  # segundos totales

func _ready():
	game_timer.wait_time = Global.game_time
	time_left = game_timer.wait_time
	game_timer.start()
	update_time_label()
	Global.total_delivered_weight = 0
	# Asegúrate de conectar el timeout:
	game_timer.timeout.connect(_on_GameTimer_timeout)

func _process(delta):
	time_left = max(0, time_left - delta)
	update_time_label()

func update_time_label():
	time_label.text = "Time left: " + str(int(time_left)) + "s"

func _on_GameTimer_timeout():
	print("Time's up!")
	get_tree().change_scene_to_file("res://scenes/end_menu.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lore_tut.tscn")


func _on_tut_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lore_tut.tscn")


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lore_tut.tscn")
