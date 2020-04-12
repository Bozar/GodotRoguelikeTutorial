extends Node2D


var _new_GroupName := preload("res://library/GroupName.gd").new()

var _actors: Array = [null]


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.is_in_group(_new_GroupName.PC):
		_actors[0] = new_sprite
		print(_actors)
	elif new_sprite.is_in_group(_new_GroupName.DWARF):
		_actors.append(new_sprite)
		print(_actors)
