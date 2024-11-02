class_name Car
extends CharacterBody2D

const SPEED: int = 150
const MAX_DISTANCE: int = 200
var direction: int = 1
var start_position: Vector2
var frozen = false


func _on_ready() -> void:
	start_position = position


func _physics_process(delta: float) -> void:
	if not frozen:
		if abs(position.x - start_position.x) >= MAX_DISTANCE:
			direction *= -1				# Reverse direction
			$Sprite2D.scale.x *= -1		# Flip sprite horizontally
		velocity.x = SPEED * direction
		move_and_slide()				# Apply velocity to move Car

func freeze():
	$Sprite2D.modulate = Color(5, 5, 7, 0.6) # blue shade
	frozen = true
	
