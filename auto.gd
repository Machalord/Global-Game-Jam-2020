extends Sprite

var amor = 110
var direction = true
var andar = true
var modelo = 0
var explotar = false
var pago = 0
var dolar=preload("res://dolar.tscn")
var pagado = false
var subirAmor = false
var desvioderecha = false
var desvioizquierda = false
var valordesvioder=0
var valordesvioizq=0
var findesvio = false
var findesvio2 = false
var bocinafin=true
var tileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	tileMap = get_node("/root/game/TileMap")
	if direction:
			$Area2D.add_to_group("adelanteauto")
			$Area2D2.add_to_group("atrasauto")
			$areafreno.queue_free()
			$areafreno2.queue_free()
	else:
			$Area2D.add_to_group("atrasauto")
			$Area2D2.add_to_group("adelanteauto")
			$areafreno3.queue_free()
			$areafreno4.queue_free()
	frame_coords=Vector2(0,modelo)
	amor=110
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if subirAmor && amor < 100:
		amor += 20 * delta
	if andar:
		if tileMap.EstaMalHecho(position) && amor > 0:
			amor -= 10 * delta
		if !direction:
			if findesvio:
				if valordesvioder >0:
					valordesvioder-=1
					position=Vector2(position.x-valordesvioder,position.y-valordesvioder)
	
				elif valordesvioizq >0:
					valordesvioizq-=1
					position=Vector2(position.x+valordesvioizq,position.y+valordesvioizq)
				else:
					findesvio=false
			if desvioderecha:
				if valordesvioder<10:
					position=Vector2(position.x+valordesvioder,position.y+valordesvioder)
					valordesvioder+=1
				else:
					desvioderecha=false
			if desvioizquierda:
				if valordesvioizq<10:
					position=Vector2(position.x-valordesvioizq,position.y-valordesvioizq)
					valordesvioizq+=1
				else:
					desvioizquierda=false
		if direction:
			if findesvio2:
				if valordesvioder >0:
					valordesvioder-=1
					position=Vector2(position.x-valordesvioder,position.y-valordesvioder)
	
				elif valordesvioizq >0:
					valordesvioizq-=1
					position=Vector2(position.x+valordesvioizq,position.y+valordesvioizq)
				else:
					findesvio2=false
			if desvioderecha:
				if valordesvioder<10:
					position=Vector2(position.x+valordesvioder,position.y+valordesvioder)
					valordesvioder+=1
				else:
					desvioderecha=false
			if desvioizquierda:
				if valordesvioizq<10:
					position=Vector2(position.x-valordesvioizq,position.y-valordesvioizq)
					valordesvioizq+=1
				else:
					desvioizquierda=false
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
			if bocinafin:
				$bocina.play()
				bocinafin=false
	if explotar:
		andar=false
		$explosion/explosion/AnimationPlayer.play("explosion")
		
	if amor > 80:
		$caritas.frame = 0
		pago = 5
	elif amor > 40:
		$caritas.frame = 1
		pago=3
	else:
		$caritas.frame = 2
		pago = 1

#	pass
func instance_dolar():
	var pagado=dolar.instance()
	pagado.position = Vector2(position.x,position.y-50)
	pagado.valor=pago
	get_parent().add_child(pagado)

func _on_Area2D_area_entered(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto"):
		andar=false
	if area.is_in_group("maquina"):
		explotar=true
	if area.is_in_group("peaje"):
		andar=false
		if !pagado:
			Global.money += pago
			Global.money_aux+=pago
			Global.cantAutos +=1
			print(Global.cantAutos)
			pagado=true
			instance_dolar()
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto") or area.is_in_group("peaje"):
		andar=true
	
	if area.is_in_group("maquina"):
		explotar=true
		area.get_parent().get_parent().queue_free()
	pass # Replace with function body.


func _on_Area2D2_area_entered(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto"):
		andar=false
	if area.is_in_group("maquina"):
		explotar=true
	if area.is_in_group("peaje"):
		andar=false
		if !pagado:
			Global.money += pago
			
			pagado=true
			instance_dolar()
	if area.is_in_group("desvioder"):
		desvioderecha = true
	if area.is_in_group("desvioizq"):
		desvioizquierda = true
	if area.is_in_group("findesvio"):
		findesvio = true
	if area.is_in_group("findesvio2"):
		findesvio2 = true
	pass # Replace with function body.


func _on_Area2D2_area_exited(area):
	if area.is_in_group("cono") or area.is_in_group("atrasauto")or area.is_in_group("peaje"):
		andar=true
		
	if area.is_in_group("maquina"):
		explotar=true
		area.get_parent().get_parent().queue_free()
	pass # Replace with function body.


func _on_Area2D3_area_entered(area):
	if area.is_in_group("baila"):
		subirAmor=true
	if area.is_in_group("borrar"):
		queue_free()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	$Timer.start()
	if amor > 0:
		amor -= 5
	pass # Replace with function body.


func _on_bocina_finished():
	bocinafin=true
	pass # Replace with function body.


func _on_Area2D3_area_exited(area):
	if area.is_in_group("baila"):
		subirAmor=false
	pass # Replace with function body.
