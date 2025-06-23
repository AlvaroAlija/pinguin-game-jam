extends Area2D

@export var egg_weight: float = 10.0  # Peso del huevo de esta caja (5 o 10, por ejemplo)
@export var aceleration: float = 4500.0
var player_in_area: CharacterBody2D = null

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("interact"):
		if player_in_area.has_method("add_weight"):
			player_in_area.add_weight(egg_weight)

func _on_body_exited(body: Node2D) -> void:
	if body == player_in_area:
		player_in_area = null


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_in_area = body
