extends RigidBody3D

class_name HoseSegment

@onready var cone_twist_joint_3d: ConeTwistJoint3D = $ConeTwistJoint3D
@onready var end: Marker3D = $end

const HOSE_SEGMENT = preload("res://scenes/hose/hose_segment.tscn")
const HOSE_TIP = preload("res://scenes/hose/hose_tip.tscn")

func setup(parent:Node3D, prev_segment:RigidBody3D, segments_left:int):
	## Setup our own joint
	cone_twist_joint_3d.node_b = NodePath(prev_segment.get_path())
	
	## Create next segment
	# If its the last segment, create the hose tip
	if segments_left <= 1:
		var hose_tip_inst : Item = HOSE_TIP.instantiate()
		parent.add_child(hose_tip_inst)
		hose_tip_inst.global_transform = end.global_transform
		# This is a little messy, but setup the hose tip's joint for it as it lacks this function
		hose_tip_inst.get_node("ConeTwistJoint3D").node_b = NodePath(self.get_path())
		return
	
	# Otherwise, create a normal segment
	var hose_segment_inst : HoseSegment = HOSE_SEGMENT.instantiate()
	parent.add_child(hose_segment_inst)
	hose_segment_inst.global_transform = end.global_transform
	# Recursively call this function on the next segment
	hose_segment_inst.setup(parent, self, segments_left-1)
	
	
