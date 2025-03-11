extends Node3D

class_name HoseSegment

func attach(to_attach: Node3D) -> void:
	self.add_sibling(to_attach)
	self.reparent(to_attach)
	to_attach.position = %"Top Connector".position
