extends Sprite


var direction = true
var andar = true
var modelo = 0
var explotar = false
# Called when the node enters the scene tree for the first time.
func _ready():

	if direction:
			$Area2D.add_to_group("adelanteauto")
			$Area2D2.add_to_group("atrasauto")
	else:
			$Area2D.add_to_group("atrasauto")
			$Area2D2.add_to_group("adelanteauto")
	frame_coords=Vector2(0,modelo)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if andar:
		if direction:
			frame_coords.x=0
			position.x -= 1.28 *5
			position.y += 0.64 *5
		else:
			frame_coords.x=1
			position.x += 1.28 *5
			position.y -= 0.64 *5
	if explotar:
		andar=false

		$explosion/explosion/AnimationPlayer.play("explosion")
		
		
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto"):
		andar=false
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto"):
		andar=true
	pass # Replace with function body.


func _on_Area2D2_area_entered(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto"):
		andar=false
	if area.is_in_group("maquina"):
		explotar=true
	pass # Replace with function body.


func _on_Area2D2_area_exited(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto"):
		andar=true
	if area.is_in_group("maquina"):
		explotar=true
		area.get_parent().queue_free()
	pass # Replace with function body.


func _on_Area2D3_area_entered(area):
	if area.is_in_group("borrar"):
		queue_free()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.
