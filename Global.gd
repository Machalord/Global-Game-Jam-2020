extends Node


var money = 500
var herramienta = 0
var actionTimer = -1
var dia = 1
var cantAutos =1
var money_aux=500
var newday = true
func _ready():
	
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if newday:
		newday=false
		money_aux=money
		cantAutos=1
	if actionTimer >= 0:
		actionTimer -= delta
	pass
