extends Area2D

@onready var spawn_zone1 = $"../Node2D"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.global_position = spawn_zone1.global_position
