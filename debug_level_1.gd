extends Node3D

const DefaultServerIP = "127.0.0.1"
const Port = 7000
const MaxConnections = 20

var playerInfo = [multiplayer.get_unique_id(), $Player.position]

func _ready():
	multiplayer.peer_connected.connect(_on_player_connected)
	multiplayer.peer_disconnected.connect(_on_player_disconnected)
	multiplayer.server_disconnected.connect(_on_server_disconnected)

func _on_player_connected():
	pass

func _on_player_disconnected():
	pass

func _on_server_disconnected():
	pass

func join_game(address = ""):
	if address.is_empty():
		address = DefaultServerIP
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(address, Port)
	if error:
		return error
	multiplayer.multiplayer_peer = peer
	
func create_game():
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(Port, MaxConnections)
	if error:
		return error
	multiplayer.multiplayer_peer = peer
	
