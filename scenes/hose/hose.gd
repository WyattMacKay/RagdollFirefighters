extends Node3D

@export var num_segments := 5

@onready var hose_segment := preload("res://scenes/hose/hose_segment.tscn")
@onready var hose_tip := preload("res://scenes/hose/hose_tip.tscn")

func _ready() -> void:
	var i = 0
	var last_segment: HoseSegment = null
	while i < num_segments:
		var curr_segment = hose_segment.instantiate()
		if last_segment:
			last_segment.attach(curr_segment)
		else:
			self.add_child(curr_segment)
		last_segment = curr_segment
		i += 1
