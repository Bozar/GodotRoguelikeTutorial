extends "res://library/RootNodeTemplate.gd"


const INIT_WORLD: String = "InitWorld"
const PC_MOVE: String = "PCMove"
const PC_ATTACK: String = "PCMove/PCAttack"
const NPC: String = "EnemyAI"
const SCHEDULE: String = "Schedule"
const DUNGEON: String = "DungeonBoard"
const REMOVE: String = "RemoveObject"
const SIDEBAR: String = "MainGUI/MainHBox/SidebarVBox"
const MODELINE: String = "MainGUI/MainHBox/Modeline"

const SIGNAL_BIND: Array = [
	[
		"sprite_created", "_on_InitWorld_sprite_created",
		INIT_WORLD,
		PC_MOVE, NPC, SCHEDULE, DUNGEON,
	],
	[
		"turn_started", "_on_Schedule_turn_started",
		SCHEDULE,
		PC_MOVE, NPC, SIDEBAR,
	],
	[
		"turn_ended", "_on_Schedule_turn_ended",
		SCHEDULE,
		MODELINE,
	],
	[
		"sprite_removed", "_on_RemoveObject_sprite_removed",
		REMOVE,
		DUNGEON, SCHEDULE,
	],
	[
		"enemy_warned", "_on_EnemyAI_enemy_warned",
		NPC,
		MODELINE,
	],
	[
		"pc_moved", "_on_PCMove_pc_moved",
		PC_MOVE,
		MODELINE,
	],
	[
		"pc_attacked", "_on_PCAttack_pc_attacked",
		PC_ATTACK,
		MODELINE,
	],
]

const NODE_REF: Array = [
	[
		"_ref_DungeonBoard",
		DUNGEON,
		PC_MOVE, PC_ATTACK, REMOVE, INIT_WORLD,
	],
	[
		"_ref_Schedule",
		SCHEDULE,
		PC_MOVE, NPC, PC_ATTACK,
	],
	[
		"_ref_RemoveObject",
		REMOVE,
		PC_ATTACK,
	],
]


func _init().(SIGNAL_BIND, NODE_REF) -> void:
	pass
