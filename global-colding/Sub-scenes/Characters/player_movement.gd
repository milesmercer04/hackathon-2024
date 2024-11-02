extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ICE_BOLT = preload("res://Sub-scenes/Ice Bolt/ice_bolt.tscn")

@onready var character = self
@onready var firing_position = $Marker2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		shoot()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var isLeft = false
	if character.scale.y == -1:
		isLeft = velocity.x > 0
	else:
		isLeft = velocity.x < 0
	
	if isLeft:
		character.scale.x *= -1
	move_and_slide()
	

func shoot():
	var bolt = ICE_BOLT.instantiate()
	bolt.scale.x = character.scale.y
	get_parent().add_child(bolt)
	bolt.position = firing_position.global_position
