extends Node2D


var _new_DungeonSize := preload("res://library/DungeonSize.gd").new()


func is_inside_dungeon(x: int, y: int) -> bool:
	return (x > -1) and (x < _new_DungeonSize.MAX_X) \
			and (y > -1) and (y < _new_DungeonSize.MAX_Y)
