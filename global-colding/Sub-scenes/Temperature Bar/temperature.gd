extends Control

# only starts existing once TemperatureBar is called
onready var temperature_bar = $TemperatureBar
onready var object_detector = $ObjectDetector

# base temp is 70 degrees
var temperature = 70


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_current_temp:
	
func get_object_temp:
	
