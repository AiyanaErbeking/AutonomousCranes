extends Node3D

var lift_speed := 20.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_down"):
		move_hook_towards_boom(-lift_speed * delta)
	elif Input.is_action_pressed("move_up"):
		move_hook_towards_boom(lift_speed * delta)

	
func move_hook_towards_boom(amount: float):
	var new_position = position
	new_position.y += amount
	
	# Clamp the hook's movement to stay within the boom's height
	new_position.y = clamp(new_position.y, 20, 140)
	
	# Apply the new position
	position = new_position
