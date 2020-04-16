extends Node2D


# "/root/MainScene"
var _path_to_self: String
# [signal_name, func_name, source_node, target_node]
var _signal_bind: Array
# [target_var_name, source_node, target_node]
var _node_ref: Array


func _init(_signal: Array, _node: Array) -> void:
	_signal_bind = _signal
	_node_ref = _node


func _ready() -> void:
	_set_path()
	_set_signal()
	_set_node_ref()


func _set_path() -> void:
	_path_to_self = get_path()


func _set_signal() -> void:
	var __

	for s in _signal_bind:
		# [signal_name, func_name, source_node, target_node]
		for i in range(3, len(s)):
			__ = get_node(_get_path(s[2])).connect(s[0],
					get_node(_get_path(s[i])), s[1])


func _set_node_ref() -> void:
	for n in _node_ref:
		# [target_var_name, source_node, target_node]
		for i in range(2, len(n)):
			get_node(_get_path(n[i]))[n[0]] = get_node(_get_path(n[1]))


func _get_path(path_to_node: String) -> String:
	return "{0}/{1}".format([_path_to_self, path_to_node])
