extends Sprite

var andar = true
var transparencia = false
var alpha = 0.0

var mapaPos
func SetPosicion(pos):
	mapaPos = pos

func GetMapaPos():
	return mapaPos

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
		get_parent().queue_free()

func _on_Area2D_area_entered(area):
	if area.is_in_group("volcador") and area == get_parent().get_child(1):
		andar=false
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	andar = true
	var tilemap = get_node("/root/game/TileMap")
	tilemap.SetNodeTipe(mapaPos,5)
	transparencia=true
	pass # Replace with function body.
