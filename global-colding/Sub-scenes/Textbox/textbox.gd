extends CanvasLayer



@onready var textbox_container = $MarginContainer/TextboxContainer
@onready var label = $MarginContainer/TextboxContainer/MarginContainer/Label

const CHAR_READ_RATE = 0.05
var tween

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

func _ready():
	print("Starting state: State.READY")
	hide_textbox()
	queue_text("Girl you have been chosen...")
	queue_text("The heat death of the universe is foretold in humanity's hubris")
	queue_text("Global warming will lead to the end of us all!")
	queue_text("It's up to you to become a champion of ice in order to stop a terrible fate for all sentient life in the universe")
	queue_text("Go forth and make glorious, resplendent ice!")

func _process(_delta):
	match current_state:
		State.READY:
			if !text_queue.is_empty():
				tween = create_tween()
				display_text()
			else:
				hide_textbox()
		State.READING:
			
			if Input.is_action_just_pressed("ui_accept"):
				tween.kill()
				if label.visible_ratio == 1.0:
					change_state(State.READY)
				else:
					label.visible_ratio = 1.0
					change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				change_state(State.READY)
				

func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textbox():
	label.text = ""
	textbox_container.hide()

func show_textbox():
	textbox_container.show()

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.visible_ratio = 0.0
	change_state(State.READING)
	show_textbox()
	tween.tween_property(label, "visible_ratio", 1.0, len(next_text) * CHAR_READ_RATE)
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN_OUT)

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")

func _on_Tween_tween_completed(object, key):
	change_state(State.FINISHED)
