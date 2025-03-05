extends RigidBody3D
class_name Item

enum HOLD_TYPE {
	LEFT,
	RIGHT,
	CENTER,
}

@export var mesh := "res://placeholder-models/ball.tres"

var node: Node

func _ready() -> void:
	$Mesh.mesh = load(mesh)

func use() -> void:
	push_error("Child classes must overwrite the use() function.")
