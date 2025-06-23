extends Area2D

var total_eggs_weight: float = 0.0
@onready var spawn_zone = $"../Node2D"

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node2D) -> void:
	# Comprobamos que el cuerpo es el pingüino (puedes cambiar el nombre o usar grupos)
	if body.is_in_group("player"):
		$CPUParticles2D.emitting = true
		$CPUParticles2D2.emitting = true
		# El pingüino debe tener la propiedad total_weight
		if body.has_method("get_total_weight"):
			var weight = body.get_total_weight()
			var extra_weight = weight - 1.0  # Peso base 1
			
			
			if extra_weight > 0:
				total_eggs_weight += extra_weight
				Global.total_delivered_weight += extra_weight
				print("Huevos entregados: ", total_eggs_weight, "kg")
				# Aquí puedes emitir una señal, actualizar UI, etc.
				# Además, el pingüino debería "soltar" el huevo al entregar:
				body.call("add_weight", 0.0)  # Resetea el peso
