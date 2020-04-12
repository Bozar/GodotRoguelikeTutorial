extends Node2D


var __


func _ready():
	__ = get_node("InitWorld").connect("sprite_created", get_node("PCMove"),
			"_on_InitWorld_sprite_created")
	__ = get_node("InitWorld").connect("sprite_created", get_node("Schedule"),
			"_on_InitWorld_sprite_created")

	__ = get_node("Schedule").connect("turn_started", get_node("PCMove"),
			"_on_Schedule_turn_started")
