extends Control

# Define the temperature bar and area detection
@onready var temperature_bar = $ProgressBar
@onready var area_detector = $Area2D

# Temperature parameters
var current_temperature = 50  # Starting temperature
var target_temperature = 50   # Desired temperature
var temperature_change_rate = 5  # Rate of temperature change per detected object
var transition_speed = 5.0  # Speed of the transition (higher = faster)

func _on_body_entered(body):
	# Increase target temperature when an object enters the area
	if body.is_in_group("heat_sources"):
		target_temperature += temperature_change_rate

func _on_body_exited(body):
	# Decrease target temperature when an object exits the area
	if body.is_in_group("heat_sources"):
		target_temperature -= temperature_change_rate

func _process(delta):
	# Smoothly transition the current temperature towards the target temperature
	current_temperature = lerp(current_temperature, target_temperature, transition_speed * delta)
	
	# Clamp the current temperature value and update the ProgressBar
	current_temperature = clamp(current_temperature, 0, temperature_bar.max_value)
	temperature_bar.value = current_temperature
	
