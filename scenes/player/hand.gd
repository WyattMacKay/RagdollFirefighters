extends Node3D

var item: Item
var holding := false

func pick_up(new_item: Item):
	item = new_item
	item.reparent(self)
	item.process_mode = Node.PROCESS_MODE_DISABLED
	item.position = Vector3(0, 0, 0)

func drop() -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("use") and item:
		item.use()
	
	elif event.is_action_pressed("pick_up") and not holding:
		var bodies: Array[Node3D] = $PickupRange.get_overlapping_bodies()
		for body in bodies:
			if body is Item:
				pick_up(body as Item)
