extends Node2D


export var direccion = true
var num=0
var auto = preload("res://auto.tscn")
var tiempoentreautos=true

func _process(delta):
	randomize()
	num = int(rand_range(200,400))
	
	if num==200 and tiempoentreautos and get_tree().get_nodes_in_group("autos").size()<150:
		tiempoentreautos=false
		$Timer.start()
		var newauto=auto.instance()
		newauto.direction = direccion
		newauto.modelo=int(rand_range(0,5))
		add_child(newauto)
#	pass


func _on_Timer_timeout():
	tiempoentreautos=true
	pass # Replace with function body.
