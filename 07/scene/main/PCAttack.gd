extends Node2D


const DungeonBoard := preload("res://scene/main/DungeonBoard.gd")
const Schedule := preload("res://scene/main/Schedule.gd")

var _ref_DungeonBoard: DungeonBoard
var _ref_Schedule: Schedule


func attack(group_name: String, x: int, y: int) -> void:
	if not _ref_DungeonBoard.has_sprite(group_name, x, y):
		return
	print("Attack.")
	_ref_Schedule.end_turn()
