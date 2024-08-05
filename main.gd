extends Node2D

@onready
var player = $Player

@onready
var shark  = $Shark

@onready
var GameManager = $GameManger

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.init(player)
	shark.init(GameManager)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
