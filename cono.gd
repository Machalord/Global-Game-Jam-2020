extends Sprite

var mouseInArea = false

func isMouseOver():
	return mouseInArea

func _process(delta):
	if Input.is_action_just_pressed("MouseLeftClick") and mouseInArea:
		Global.actionTimer = 0.2
		queue_free()
#	pass

func _on_Area2D_mouse_entered():
	mouseInArea = true
	pass # Replace with function body.

func _on_Area2D_mouse_exited():
	mouseInArea = false
	pass # Replace with function body.
