extends Node2D


@export var world_scene: PackedScene 

var player_count = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_player_count(players):
	player_count = players


func _on_hud_start_game():
	# Make enough viewports for the number of players
	if player_count == 2:
		var horizontalContainer = HBoxContainer.new()
		horizontalContainer.size = get_viewport_rect().size
		for i in 2:
			make_viewport(i + 1, horizontalContainer,
					Vector2(horizontalContainer.size.x / 2, horizontalContainer.size.y))
		add_child(horizontalContainer)
	else:
		var verticalContainer = VBoxContainer.new()
		verticalContainer.size = get_viewport_rect().size
		var horizontalContainer1 = HBoxContainer.new()
		horizontalContainer1.size = Vector2(verticalContainer.size.x, verticalContainer.size.y / 2)
		var horizontalContainer2 = HBoxContainer.new()
		horizontalContainer2.size = Vector2(verticalContainer.size.x, verticalContainer.size.y / 2)
		
		verticalContainer.size = get_viewport_rect().size		
		verticalContainer.add_child(horizontalContainer1)
		verticalContainer.add_child(horizontalContainer2)
		
		for i in 2:
			make_viewport(i + 1, horizontalContainer1,
					Vector2(horizontalContainer1.size.x / 2, horizontalContainer1.size.y))
		
		make_viewport(3, horizontalContainer2,
				Vector2(horizontalContainer2.size.x / 2, horizontalContainer2.size.y))
		
		if player_count == 4:
			make_viewport(4, horizontalContainer2,
					Vector2(horizontalContainer2.size.x / 2, horizontalContainer2.size.y))
			
		add_child(verticalContainer)
			



func make_viewport(count, container, size):
	var viewportContainer = SubViewportContainer.new()
	var viewport = SubViewport.new()
	viewport.size = size
	var scene = world_scene.instantiate()
	scene.scene_number = count
	
	viewport.add_child(scene)
	viewportContainer.add_child(viewport)
	container.add_child(viewportContainer)
