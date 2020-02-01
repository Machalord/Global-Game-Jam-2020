extends Node2D


export var direccion = true
var num=0
var auto = preload("res://auto.tscn")


func _process(delta):
	randomize()
	num = int(rand_range(200,1000))
	if num==100:
		print("seeeeeeeeeeeeeeeeeeee")
		var newauto=auto.instance()
		newauto.direction = direccion
		newauto.modelo=int(rand_range(0,5))
		add_child(newauto)
#	pass
