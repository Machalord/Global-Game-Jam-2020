extends Sprite

var andar = true
var transparencia = false
var alpha = 0.0
func _process(delta):
	if andar:
		position.x -= 1.28/2
		position.y += 0.64/2
	if transparencia:
		alpha -= 0.01 
		modulate.a =alpha
	else:
		if alpha<1:
			alpha += 0.01
			modulate.a =alpha
	if alpha <= 0:
		queue_free()


func _on_Area2D_area_entered(area):
	if area.is_in_group("volcador"):
		andar=false
	
	
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	andar = true
	transparencia=true
	pass # Replace with function body.
