extends Node2D


var stop = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !stop:
		
		$AudioStreamPlayer.volume_db=-15
	else:
		$AudioStreamPlayer.volume_db=-100
