extends Camera2D


@export var target_path: NodePath  # Asigna el nodo del jugador desde el editor
@export var follow_smoothness: float = 5.0  # Cuanto más alto, más lento sigue

@onready var total_label = $Label

var target: Node2D

func _ready():
	if target_path != null:
		target = get_node(target_path)



func _process(delta):
	total_label.text = "Total Delivered: " + str(Global.total_delivered_weight) + " kg"
	if target:
		var desired_position = target.global_position
		global_position = global_position.lerp(desired_position, delta * follow_smoothness)
