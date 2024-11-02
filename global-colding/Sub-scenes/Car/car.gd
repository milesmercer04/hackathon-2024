extends RigidBody2D

var speed: int = 10
var move_distance: int = 200
var direction: int = -1
var is_frozen: bool = false
var start_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.scale.x = abs($Sprite2D.scale.x)
	start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if abs(position.x - start_position.x) >= move_distance:
		$Sprite2D.scale.x *= -1
		direction *= -1
	position.x += speed * direction
