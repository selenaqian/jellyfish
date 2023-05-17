extends RigidBody2D


signal blasted

# Minimum speed of the mob in meters per second.
@export var min_speed = 150
# Maximum speed of the mob in meters per second.
@export var max_speed = 250


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


# This function will be called from the Main scene.
func initialize(start_position, player_position):
	position = start_position
	look_at(player_position)
	
	# Rotate this mob randomly within range of -90 and +90 degrees,
	# so that it doesn't move directly towards the player.
	rotate(randf_range(-PI / 4, PI / 4))

	var velocity = Vector2(randi_range(min_speed, max_speed), 0.0)

	linear_velocity = velocity.rotated(rotation)
	
	rotation = atan2(linear_velocity.x, -linear_velocity.y)


func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if not body.is_in_group("enemy"):
		blasted.emit()
		queue_free()
