extends Node


var player: Player
# Called when the node enters the scene tree for the first time.

func init(pl: Player):
	player = pl
	
func get_player_pos():
	return player.position	

