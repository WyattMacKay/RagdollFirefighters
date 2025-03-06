extends Node3D

var item: Item
var holding := false
var old_parent: Node

func pick_up(new_item: Item):
	item = new_item
	old_parent = item.get_parent()
	item.reparent(self)
	item.process_mode = Node.PROCESS_MODE_DISABLED
	item.position = Vector3(0, 0, 0)
	holding = true

func drop() -> void:
	item.process_mode = Node.PROCESS_MODE_PAUSABLE
	item.reparent(old_parent)
	item.linear_velocity = self.get_parent().velocity
	old_parent = null
	item = null
	holding = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("use") and item:
		item.use()
	
	elif event.is_action_pressed("pick_up") and not holding:
		
		var bodies: Array[Node3D] = $PickupRange.get_overlapping_bodies()
		for body in bodies:
			if body is Item:
				pick_up(body as Item)
	
	elif event.is_action_released("pick_up") and holding:
		drop()
