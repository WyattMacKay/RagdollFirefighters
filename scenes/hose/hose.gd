extends Node3D

@export var num_segments := 5

const HOSE_SEGMENT = preload("res://scenes/hose/hose_segment.tscn")
@onready var rigid_body_3d: RigidBody3D = $RigidBody3D
#@onready var hose_segment := preload("res://scenes/hose/hose_segment.tscn")
#@onready var hose_tip := preload("res://scenes/hose/hose_tip.tscn")
#@onready var joint := preload("res://scenes/hose/twist_joint.tscn")

func _ready() -> void:
	## Create initial segment
	var hose_segment_inst : HoseSegment = HOSE_SEGMENT.instantiate()
	self.add_child(hose_segment_inst)
	hose_segment_inst.global_transform = self.global_transform
	hose_segment_inst.setup(self, rigid_body_3d, num_segments)
	
	#var i = 0
	#var last_segment: HoseSegment = null
	#while i < num_segments:
		#var curr_segment: HoseSegment = hose_segment.instantiate()
		#if last_segment:
			#set_up_joint(last_segment, curr_segment)
		#else:
			#self.add_child(curr_segment)
		#last_segment = curr_segment
		#i += 1
	#
	#var tip := hose_tip.instantiate()
	#if last_segment:
		#set_up_joint(last_segment, tip)
		#

#func set_up_joint(parent: Node3D, to_attach: Node3D) -> void:
	#var joint_node: ConeTwistJoint3D = joint.instantiate()
	#parent.add_child(to_attach)
	#parent.add_child(joint_node)
	#joint_node.node_a = parent.get_path()
	#joint_node.node_b = to_attach.get_path()
	#
	#joint_node.position = parent.recommended_joint_position()
	#to_attach.position = parent.recommended_joint_position()
