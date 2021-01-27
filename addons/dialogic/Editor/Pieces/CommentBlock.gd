tool
extends Control

var text_height = 80
var editor_reference
var preview = '...'
onready var toggler = get_node("PanelContainer/VBoxContainer/Header/VisibleToggle")

# This is the information of this event and it will get parsed and saved to the JSON file.
var event_data = {
	'comment': ''
}


func _ready():
	connect("gui_input", self, '_on_gui_input')
	$PanelContainer/VBoxContainer/TextEdit.set("rect_min_size", Vector2(0, 80))
	update_preview()


func check_portraits():
	pass


func _on_TextEdit_text_changed():
	event_data['comment'] = $PanelContainer/VBoxContainer/TextEdit.text
	update_preview()


func load_text(text):
	get_node("VBoxContainer/TextEdit").text = text
	event_data['comment'] = text
	update_preview()


func load_data(data):
	event_data = data
	$PanelContainer/VBoxContainer/TextEdit.text = event_data['comment']
	update_preview()


func update_preview():
	var text = event_data['comment']
	if text == '':
		return '...'
	if '\n' in text:
		text = text.split('\n')[0]
	preview = text
	if preview.length() > 60:
		preview = preview.left(60) + '...'
	return preview


func _on_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.doubleclick:
		if event.button_index == 1:
			if toggler.pressed:
				toggler.pressed = false
			else:
				toggler.pressed = true
