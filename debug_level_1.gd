extends Node

signal connection_failed()

var LocalPlayer = preload("res://character_body_3d.tscn").instantiate()

func _ready():
	var root = get_tree().root
	var menu = root.get_node("Main Menu")
	
	LocalPlayer.name = "Player"
	
	multiplayer.multiplayer_peer = null
	var peer = ENetMultiplayerPeer.new()
	
	if menu.connHost == 0:
		var localIP = IP.resolve_hostname(str(OS.get_environment("COMPUTERNAME")),1)
		#print(localIP)
		var error = peer.create_client("127.0.0.1", 7355)
		if error:
			print(error)
			return error
		multiplayer.multiplayer_peer = peer
	elif menu.connHost == 1:
		#peer.set_bind_ip("127.0.0.1")
		print(peer.create_server(7355, 16))
	
	#while(peer.get_connection_status() != 2):
	#	print(peer.get_connection_status())
	
	root.get_node("Debug Level1").get_node("Player Spawner").add_child(LocalPlayer)
	
	root.remove_child(menu)

func _on_connection_failed():
	print("e")
