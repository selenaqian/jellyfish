extends Node2D


signal hit

@export var move_right_action := "move_right"
@export var move_left_action := "move_left"
@export var move_down_action := "move_down"
@export var move_up_action := "move_up"
@export var speed : int = 400

var screen_size := Vector2(100, 100)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		rotation = atan2(velocity.x, -velocity.y)
	else:
		rotation = 0

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
