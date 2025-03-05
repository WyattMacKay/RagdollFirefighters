extends Node

class_name Item

enum HOLD_TYPE {
	LEFT,
	RIGHT,
	CENTER,
}

@export var model := "res://placeholder-models/ball.tscn"


var node: Node

func _ready() -> void:
	var model_scene := load(model)
	if model_scene:
		node = model_scene.instantiate()
		self.add_child(node)

func use() -> void:
	push_error("Child classes must overwrite the use() function.")
