extends Sprite

var mouseInArea = false

var mapaPos
func SetPosicion(pos):
	mapaPos = pos

func GetMapaPos():
	return mapaPos

func _process(delta):
	if Input.is_action_just_pressed("MouseLeftClick") and mouseInArea:
		queue_free()
#	pass

func _on_Area2D_mouse_entered():
	mouseInArea = true
	pass # Replace with function body.

func _on_Area2D_mouse_exited():
	mouseInArea = false
	pass # Replace with function body.
