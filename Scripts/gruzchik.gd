extends CharacterBody3D

@export var move_speed: float = 70.0
@export var range_min: Vector3 = Vector3(-100, 0, -100) # Minimum bounds of movement
@export var range_max: Vector3 = Vector3(100, 0, 100)   # Maximum bounds of movement

var target_position: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set the initial target position
	set_new_target()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Move towards the target position
	move_towards_target(delta)

	var collision_count = get_slide_collision_count()
	# Check if we've reached the target
	if global_position.distance_to(target_position) < 0.1 || collision_count>0 || velocity == Vector3(0, 0, 0):
		# Set a new target position within the range
		set_new_target()

# Sets a new random target position within the specified range
func set_new_target() -> void:
	var new_x = randf_range(range_min.x, range_max.x)
	var new_y = randf_range(range_min.y, range_max.y)
	var new_z = randf_range(range_min.z, range_max.z)
	target_position = Vector3(new_x, new_y, new_z)

# Moves the object towards the target position
func move_towards_target(_delta: float) -> void:
	var direction = (target_position - global_position).normalized()
	velocity = direction * move_speed
	move_and_slide()
