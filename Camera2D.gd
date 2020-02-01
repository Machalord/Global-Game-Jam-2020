extends Camera2D

var mouse_izq =false
var mouse_der =false
var mouse_up =false
var mouse_down = false
func _process(delta):
	if mouse_izq:
		position.x-=15
	if mouse_der:
		position.x+=15
	if mouse_up:
		position.y-=15
	if mouse_down:
		position.y += 15
		


func _on_AreaIzq_mouse_entered():
	mouse_izq =true
	pass # Replace with function body.


func _on_AreaIzq_mouse_exited():
	mouse_izq =false
	pass # Replace with function body.


func _on_AreaDer_mouse_entered():
	mouse_der =true
	pass # Replace with function body.


func _on_AreaDer_mouse_exited():
	mouse_der =false
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	mouse_down =true
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	mouse_down = false
	pass # Replace with function body.


func _on_Area2D2_mouse_entered():
	mouse_up =true
	pass # Replace with function body.


func _on_Area2D2_mouse_exited():
	mouse_up =false
	pass # Replace with function body.
