extends Node


var money = 500
var herramienta = 0
var actionTimer = -1
var dia = 1
var cantAutos =0
var money_aux=0
var newday = true
func _ready():
	
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if newday:
		newday=false
		money_aux=0
		cantAutos=0
	if actionTimer >= 0:
		actionTimer -= delta
	pass
