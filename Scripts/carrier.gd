extends Node3D

# Variables to control movement speed
var move_speed := 50.0

# How far the hook can move along the boom
var max_distance : float = 150.0
var min_distance : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_in"):
		move_hook_along_boom(-move_speed * delta)
	if Input.is_action_pressed("move_out"):
		move_hook_along_boom(move_speed * delta)
		

func move_hook_along_boom(amount: float):
	# Move the hook along the local X-axis of the boom
	var new_position = position
	new_position.x += amount
	
	# Clamp the hook's movement to stay within the boom's length
	new_position.x = clamp(new_position.x, min_distance, max_distance)
	
	# Apply the new position
	position = new_position
