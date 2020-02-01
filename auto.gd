extends Sprite

var amor = 15
var direction = true
var andar = true
var modelo = 0
var explotar = false
var pago = 0
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
		$Timer.stop()
		if direction:
			frame_coords.x=0
			position.x -= 1.28 *5
			position.y += 0.64 *5
		else:
			frame_coords.x=1
			position.x += 1.28 *5
			position.y -= 0.64 *5
	else:
		if $Timer.is_stopped():
			$Timer.start()
	if explotar:
		andar=false

		$explosion/explosion/AnimationPlayer.play("explosion")
		
	if amor > 12:
		$caritas.frame = 0
		pago = 5
	if amor <=12 and amor > 4:
		$caritas.frame = 1
		pago=3
	if amor <=4:
		$caritas.frame = 2
		pago = 1

#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto"):
		andar=false
	if area.is_in_group("maquina"):
		explotar=true
	if area.is_in_group("peaje"):
		andar=false
		Global.money += pago
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto") or area.is_in_group("peaje"):
		andar=true
	pass # Replace with function body.


func _on_Area2D2_area_entered(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto"):
		andar=false
	if area.is_in_group("maquina"):
		explotar=true
	if area.is_in_group("peaje"):
		andar=false
		Global.money += pago
	pass # Replace with function body.


func _on_Area2D2_area_exited(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto")or area.is_in_group("peaje"):
		andar=true
	if area.is_in_group("maquina"):
		explotar=true
		area.get_parent().get_parent().queue_free()
	pass # Replace with function body.


func _on_Area2D3_area_entered(area):
	if area.is_in_group("borrar"):
		queue_free()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	$Timer.start()
	amor-=1
	pass # Replace with function body.
