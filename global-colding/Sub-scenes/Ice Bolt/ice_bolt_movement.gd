extends Area2D

const SPEED = 400

func _ready():
	pass


func _physics_process(delta):
	position += transform.x * SPEED * delta
