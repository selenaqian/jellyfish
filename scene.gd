extends Node2D

var scene_number : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.screen_size = get_viewport_rect().size
	$Player.move_right_action = "move_right_%s" % scene_number
	$Player.move_left_action = "move_left_%s" % scene_number
	$Player.move_up_action = "move_up_%s" % scene_number
	$Player.move_down_action = "move_down_%s" % scene_number

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
