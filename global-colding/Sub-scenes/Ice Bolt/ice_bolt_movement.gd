extends Area2D

const SPEED = 400

func _ready():
	pass

func _physics_process(delta):
	position += transform.x * SPEED * delta

func _on_body_entered(body: Node) -> void:
	if body.name == "Car":
		body.freeze()
