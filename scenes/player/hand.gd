extends Node3D

var item: Item

func pick_up(new_item: Item):
	item = new_item
	item.reparent(self)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("use") and item:
		item.use()
	
	elif event.is_action_pressed("pick_up"):
		var bodies: Array[Node3D] = $PickupRange.get_overlapping_bodies()
		for body in bodies:
			print("Hmm...")
			print(body.get_class())
			if body is Item:
				pick_up(body as Item)
				print("YIPPEE!")
