extends Node

class_name Item

@export var model := "res://placeholder-models/ball.tscn"


func _ready() -> void:
	var model_scene := load(model)
	self.add_child(model_scene.instantiate())

func use() -> void:
	push_error("Child classes must overwrite the use() function.")
