extends Node2D


var _new_GroupName := preload("res://library/GroupName.gd").new()


func _on_Schedule_turn_started(current_sprite: Sprite) -> void:
	if not current_sprite.is_in_group(_new_GroupName.DWARF):
		return

	get_node("../Schedule").end_turn()
