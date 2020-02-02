extends Node


var money
var herramienta = 0
var actionTimer = -1
var dia = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if actionTimer >= 0:
		actionTimer -= delta
	pass
