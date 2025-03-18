extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const TURN_SPEED = 10.0 

@onready var cam = %Camera  # Adjust the path to your camera

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	var forward = cam.global_transform.basis.z
	forward.y = 0
	forward = forward.normalized()
	
	var right = cam.global_transform.basis.x
	right.y = 0
	right = right.normalized()

	var move_dir = (right * input_dir.x + forward * input_dir.y).normalized()
	
	if move_dir != Vector3.ZERO:
		velocity.x = move_dir.x * SPEED
		velocity.z = move_dir.z * SPEED
		
		var target_angle = atan2(move_dir.x, move_dir.z)
		rotation.y = lerp_angle(rotation.y, target_angle, TURN_SPEED * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
