extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var vel = 0
var dobleVel = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("arriba") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction := Input.get_axis("izquierda", "derecha")
	if direction and Input.is_action_pressed("derecha"):
		velocity.x = vel + 400
	elif direction and Input.is_action_pressed("izquierda"):
		velocity.x = vel -400
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "prota":
		print ("has muerto")


func _on_timer_timeout() -> void:
	dobleVel = true
	if dobleVel == true and Input.is_action_pressed("derecha"):
		vel = 400
	elif dobleVel == true and Input.is_action_pressed("izquierda"):
		vel = -400
