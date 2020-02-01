extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("adelanteauto"):
		if $Timer.is_stopped():
			$Timer.start()
	pass # Replace with function body.


func _on_Timer_timeout():
	$Area2D.position=$Position2D2.position
	frame=1
	
	if $Timer2.is_stopped():
			$Timer2.start()
	pass # Replace with function body.


func _on_Timer2_timeout():
	frame=0
	$Area2D.position=$Position2D.position
	pass # Replace with function body.
