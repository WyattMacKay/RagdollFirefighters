extends Node3D

var item: Item

func pick_up(new_item: Item):
	item = new_item
	item.reparent(self)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		item.use()
