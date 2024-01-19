extends Control

var debug_level = preload("res://debug_level_1.tscn").instantiate()
var ip = 0
var connHost = -1
var port = -1

func _on_connect_button_up():
	ip = $"IP Input".get_text()
	
	connHost = 0
	port = $"Port Input".get_text()
	var root = get_tree().root
	root.add_child(debug_level)

func _on_host_button_up():
	connHost = 1
	var root = get_tree().root
	root.add_child(debug_level)

