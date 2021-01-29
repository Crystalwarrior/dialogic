tool
extends Control

var editor_reference
var editorPopup


# This is the information of this event and it will get parsed and saved to the JSON file.
var event_data = {
	'rebuttal': '',
	'statements': []
}


func _ready():
	#
	pass


func load_data(data):
	event_data = data
	$PanelContainer/VBoxContainer/Header/LineEdit.text = event_data['rebuttal']


func _on_LineEdit_text_changed(new_text):
	event_data['rebuttal'] = new_text
