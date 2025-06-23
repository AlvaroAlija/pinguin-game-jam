extends CharacterBody2D

@export var base_acceleration: float = 4000.0
@export var max_speed: float = 300.0
@export var jump_force: float = 600.0
@export var gravity: float = 1200.0
@export var base_slide_force: float = 0.05
@export var jump_cooldown: float = 2.0
@export var coyote_time_max: float = 0.2  # tiempo en que aún puedes saltar tras caer

@onready var egg_weight_label = $EggWeightLabel
@onready var jump_bar = $JumpBar
@onready var sprite = $AnimatedSprite2D

var current_egg_weight: float = 0.0
var total_weight: float = 1.0

var jump_charge: float = 0.0
var coyote_timer: float = 0.0
var with_egg = false

func _physics_process(delta: float) -> void:
	with_egg = total_weight >= 2
	egg_weight_label.text = str(current_egg_weight) + " kg" if current_egg_weight > 0.0 else ""

	var direction := Input.get_action_strength("right") - Input.get_action_strength("left")
	var velocity = self.velocity

	# Gravedad
	if not is_on_floor():
		velocity.y += gravity * delta
		coyote_timer = max(coyote_timer - delta, 0.0)
	else:
		coyote_timer = coyote_time_max

	# Cargar salto en todo momento
	if jump_charge < jump_cooldown:
		jump_charge += delta
		jump_charge = clamp(jump_charge, 0.0, jump_cooldown)

	# Saltar si cargado y coyote time activo
	if Input.is_action_just_pressed("up") and jump_charge >= jump_cooldown and coyote_timer > 0:
		velocity.y = -jump_force
		jump_charge = 0.0
		coyote_timer = 0.0  # resetear para no saltar doble

	# Movimiento horizontal
	if direction != 0:
		if sign(direction) == sign(velocity.x):
			velocity.x += direction * base_acceleration / total_weight * delta
		else:
			velocity.x += direction * base_acceleration / (total_weight * 2) * delta
		velocity.x = clamp(velocity.x, -max_speed, max_speed)
	else:
		var slide_force = clamp(base_slide_force / total_weight, 0.005, 0.1)
		velocity.x = lerp(velocity.x, 0.0, slide_force)

	self.velocity = velocity
	move_and_slide()

	# Animación
	update_animation(direction)

	# Actualizar barra visual
	jump_bar.value = jump_charge / jump_cooldown


func update_animation(direction: float) -> void:
	if abs(direction) > 0:
		sprite.flip_h = direction < 0  # Ahora se voltea también en el aire

	if not is_on_floor():
		sprite.play("jump")
	elif abs(direction) > 0:
		sprite.play("run_egg" if with_egg else "run")
	else:
		sprite.play("idle_egg" if with_egg else "idle")



func add_weight(egg_weight: float) -> void:
	current_egg_weight = egg_weight
	total_weight = 1.0 + egg_weight
	print("Peso total:", total_weight)

func get_total_weight() -> float:
	return total_weight
