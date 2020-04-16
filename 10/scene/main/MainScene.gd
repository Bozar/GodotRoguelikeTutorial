extends Node2D


var __


func _ready():
	__ = get_node("InitWorld").connect("sprite_created", get_node("PCMove"),
			"_on_InitWorld_sprite_created")
	__ = get_node("InitWorld").connect("sprite_created", get_node("Schedule"),
			"_on_InitWorld_sprite_created")
	__ = get_node("InitWorld").connect("sprite_created",
			get_node("DungeonBoard"), "_on_InitWorld_sprite_created")
	__ = get_node("InitWorld").connect("sprite_created",
			get_node("EnemyAI"), "_on_InitWorld_sprite_created")

	__ = get_node("RemoveObject").connect("sprite_removed", get_node("Schedule"),
			"_on_RemoveObject_sprite_removed")
	__ = get_node("RemoveObject").connect("sprite_removed",
			get_node("DungeonBoard"), "_on_RemoveObject_sprite_removed")

	__ = get_node("Schedule").connect("turn_started", get_node("PCMove"),
			"_on_Schedule_turn_started")
	__ = get_node("Schedule").connect("turn_started", get_node("EnemyAI"),
			"_on_Schedule_turn_started")
	__ = get_node("Schedule").connect("turn_started",
			get_node("MainGUI/MainHBox/SidebarVBox"),
			"_on_Schedule_turn_started")

	__ = get_node("PCMove").connect("pc_moved",
			get_node("MainGUI/MainHBox/Modeline"), "_on_PCMove_pc_moved")
	__ = get_node("PCMove/PCAttack").connect("pc_attacked",
			get_node("MainGUI/MainHBox/Modeline"), "_on_PCAttack_pc_attacked")
	__ = get_node("EnemyAI").connect("enemy_warned",
			get_node("MainGUI/MainHBox/Modeline"), "_on_EnemyAI_enemy_warned")
	__ = get_node("Schedule").connect("turn_ended",
			get_node("MainGUI/MainHBox/Modeline"), "_on_Schedule_turn_ended")


	get_node("PCMove")._ref_Schedule = get_node("Schedule")
	get_node("EnemyAI")._ref_Schedule = get_node("Schedule")
	get_node("PCMove/PCAttack")._ref_Schedule = get_node("Schedule")

	get_node("PCMove")._ref_DungeonBoard = get_node("DungeonBoard")
	get_node("PCMove/PCAttack")._ref_DungeonBoard = get_node("DungeonBoard")
	get_node("RemoveObject")._ref_DungeonBoard = get_node("DungeonBoard")
	get_node("InitWorld")._ref_DungeonBoard = get_node("DungeonBoard")

	get_node("PCMove/PCAttack")._ref_RemoveObject = get_node("RemoveObject")
