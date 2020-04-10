extends Node2D


var _new_ConvertCoord := preload("res://library/ConvertCoord.gd").new()
var _new_InputName := preload("res://library/InputName.gd").new()
var _new_GroupName := preload("res://library/GroupName.gd").new()

var _pc: Sprite


func _ready() -> void:
	set_process_unhandled_input(false)


func _unhandled_input(event: InputEvent) -> void:
	var source: Array = _new_ConvertCoord.vector_to_array(_pc.position)
	var x: int = source[0]
	var y: int = source[1]

	if event.is_action_pressed(_new_InputName.MOVE_LEFT):
		x -= 1
	elif event.is_action_pressed(_new_InputName.MOVE_RIGHT):
		x += 1
	elif event.is_action_pressed(_new_InputName.MOVE_UP):
		y -= 1
	elif event.is_action_pressed(_new_InputName.MOVE_DOWN):
		y += 1

	_pc.position = _new_ConvertCoord.index_to_vector(x, y)


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.is_in_group(_new_GroupName.PC):
		_pc = new_sprite
		set_process_unhandled_input(true)
