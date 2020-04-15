extends VBoxContainer


const _new_GroupName = preload("res://library/GroupName.gd")

var _turn_counter: int = 0
var _turn_text: String = "Turn: {0}"

onready var _label_help: Label = get_node("Help")
onready var _label_turn: Label = get_node("Turn")


func _ready() -> void:
	_label_help.text = "RL Demo"
	_update_turn()


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if current_sprite.is_in_group(_new_GroupName.PC):
		_turn_counter += 1
		_update_turn()


func _update_turn() -> void:
	_label_turn.text = _turn_text.format([_turn_counter])
