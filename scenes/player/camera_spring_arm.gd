extends Node3D

@export var sensitivity := 0.01
@export var max_length := 5
@export var min_length := 1

@onready var spring_arm := $SpringArm3D

# Called when the node enters the scene tree for the first time.
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotation.y -= event.relative.x * sensitivity
		rotation.y = wrapf(rotation.y, 0.0, TAU)
		
		rotation.x -= event.relative.y * sensitivity
		rotation.x = clamp(rotation.x, -PI/2, PI/4)
		
	if event.is_action_pressed("wheel_up") and spring_arm.spring_length > min_length:
		spring_arm.spring_length -= 1
	if event.is_action_pressed("wheel_down") and spring_arm.spring_length < max_length:
		spring_arm.spring_length += 1
