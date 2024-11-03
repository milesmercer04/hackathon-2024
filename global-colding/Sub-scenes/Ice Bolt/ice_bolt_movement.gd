extends Area2D

const SPEED = 400

func _ready():
	pass

func _physics_process(delta):
	position += transform.x * SPEED * delta

func _on_body_entered(body: Node) -> void:
	print(body.name)
	if body is Car and not body.frozen:
		body.freeze()
		self.queue_free()
