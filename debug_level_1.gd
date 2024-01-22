extends Node

signal connection_failed()

var LocalPlayer = preload("res://character_body_3d.tscn").instantiate()

func _ready():
	var root = get_tree().root
	var menu = root.get_node("Main Menu")
	
	multiplayer.multiplayer_peer = null
	var peer = ENetMultiplayerPeer.new()
	
	if menu.connHost == 0:
		if menu.ip == "":
			peer.create_client("127.0.0.1", 7355)
		else:
			peer.create_client(menu.ip, 7355)
		multiplayer.multiplayer_peer = peer
	elif menu.connHost == 1:
		peer.create_server(7355, 16)
		multiplayer.multiplayer_peer = peer
	
	#$"MultiplayerSpawner".set_multiplayer_authority(peer.get_unique_id())
	LocalPlayer.name = "Player" + str(peer.get_unique_id())
	LocalPlayer.set_multiplayer_authority(peer.get_unique_id(), true)
	root.get_node("Debug Level1").get_node("Player Spawner").add_child(LocalPlayer)
	
	root.remove_child(menu)
