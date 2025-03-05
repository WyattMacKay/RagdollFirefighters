extends Node3D

@export var item_scene := "res://weapon/weapon.tscn"

var scene := load(item_scene)
var item: Node = scene.instantiate()

func _ready() -> void:
	self.add_child(item)		#Need to make item 90 deg. and at same position as parent.
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		item.use()
