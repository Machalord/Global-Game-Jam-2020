extends Sprite

var mouseUp = false

var mapaPos
func SetPosicion(pos):
	mapaPos = pos

func GetMapaPos():
	return mapaPos

func _process(delta):
	if Input.is_mouse_button_pressed(1) and mouseUp:
		queue_free()
#	pass


func _on_Area2D_mouse_entered():
	mouseUp = true
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	mouseUp = false
	pass # Replace with function body.
