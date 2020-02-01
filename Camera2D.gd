extends Node2D

var mouse_izq =false
var mouse_der =false
var mouse_up =false
var mouse_down = false
var areaizq=false
var areader=false
var areaup=false
var areadown=false
func _physics_process(delta):
		
	if mouse_izq and !areaizq:
		position.x-=15
	if mouse_der and !areader:
		position.x+=15
	if mouse_up and !areaup:
		position.y-=15
	if mouse_down and !areadown:
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


func _on_Areadown_mouse_entered():
	mouse_up =true
	pass # Replace with function body.


func _on_Areadown_mouse_exited():
	mouse_up = false
	pass # Replace with function body.


func _on_Areaup_mouse_entered():
	mouse_down =true
	pass # Replace with function body.


func _on_Areaup_mouse_exited():
	mouse_down =false
	pass # Replace with function body.


func _on_AreaIzq_area_entered(area):
	if area.is_in_group("areaizq"):
		areaizq=true
	pass # Replace with function body.


func _on_AreaIzq_area_exited(area):
	if area.is_in_group("areaizq"):
		areaizq=false
	pass # Replace with function body.


func _on_AreaDer_area_entered(area):
	if area.is_in_group("areader"):
		areader=true
	pass # Replace with function body.


func _on_AreaDer_area_exited(area):
	if area.is_in_group("areader"):
		areader=false
	pass # Replace with function body.


func _on_Areadown_area_entered(area):
	if area.is_in_group("areadown"):
		areadown=true
	pass # Replace with function body.


func _on_Areadown_area_exited(area):
	if area.is_in_group("areadown"):
		areadown=false
	pass # Replace with function body.


func _on_Areaup_area_entered(area):
	if area.is_in_group("areaup"):
		areaup=true
	pass # Replace with function body.


func _on_Areaup_area_exited(area):
	if area.is_in_group("areaup"):
		areaup=false
	pass # Replace with function body.












