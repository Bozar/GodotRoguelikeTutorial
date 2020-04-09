extends Node2D


var _new_InputName := preload("res://library/InputName.gd").new()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(_new_InputName.MOVE_LEFT):
		print("move left")
	elif event.is_action_pressed(_new_InputName.MOVE_RIGHT):
		print("move right")
	elif event.is_action_pressed(_new_InputName.MOVE_UP):
		print("move up")
	elif event.is_action_pressed(_new_InputName.MOVE_DOWN):
		print("move down")
