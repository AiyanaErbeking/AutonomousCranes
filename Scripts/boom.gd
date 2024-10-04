extends Node3D

# Variables to control rotation speed
var rotation_speed := 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Rotate left
	if Input.is_action_pressed("rotate_left"):
		rotate_y(rotation_speed * delta)
	# Rotate right
	if Input.is_action_pressed("rotate_right"):
		rotate_y(-rotation_speed * delta)
