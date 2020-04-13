extends Node2D


var _new_DungeonSize := preload("res://library/DungeonSize.gd").new()
var _new_GroupName := preload("res://library/GroupName.gd").new()
var _new_ConvertCoord := preload("res://library/ConvertCoord.gd").new()

# <string_group_name, <int_column, array_sprite>>
var _sprite_dict: Dictionary


func _ready() -> void:
	_init_dict()


func is_inside_dungeon(x: int, y: int) -> bool:
	return (x > -1) and (x < _new_DungeonSize.MAX_X) \
			and (y > -1) and (y < _new_DungeonSize.MAX_Y)


func has_sprite(group_name: String, x: int, y: int) -> bool:
	return get_sprite(group_name, x, y) != null


func get_sprite(group_name: String, x: int, y: int) -> Sprite:
	if not is_inside_dungeon(x, y):
		return null
	return _sprite_dict[group_name][x][y]


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	var pos: Array
	var group: String

	if new_sprite.is_in_group(_new_GroupName.DWARF):
		group = _new_GroupName.DWARF
	elif new_sprite.is_in_group(_new_GroupName.WALL):
		group = _new_GroupName.WALL
	else:
		return

	pos = _new_ConvertCoord.vector_to_array(new_sprite.position)
	_sprite_dict[group][pos[0]][pos[1]] = new_sprite


func _init_dict() -> void:
	var groups = [_new_GroupName.DWARF, _new_GroupName.WALL]

	for g in groups:
		_sprite_dict[g] = {}
		for x in range(_new_DungeonSize.MAX_X):
			_sprite_dict[g][x] = []
			_sprite_dict[g][x].resize(_new_DungeonSize.MAX_Y)
