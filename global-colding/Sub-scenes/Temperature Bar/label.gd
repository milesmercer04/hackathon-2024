extends Label
# updates label with current values for temperature
func update_text(temperature):
	text = """Temperature: %s
			""" % [temperature]
