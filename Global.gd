extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var money
var herramienta = 4
var actionTimer = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if actionTimer >= 0:
		actionTimer -= delta
	pass
