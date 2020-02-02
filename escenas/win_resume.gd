extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		$Label2.text="Money = $"+str(Global.money)
		$Label3.text="Happiness = "+str(((Global.money-Global.money_aux)/Global.cantAutos)*20)+"%"
	print("Happiness = "+str(((Global.money-Global.money_aux)/Global.cantAutos)*20))
#	pass


func _on_Button_pressed():
	get_tree().paused = false
	Global.dia+=1
	Global.newday=true
	get_tree().change_scene("res://game.tscn")
	pass # Replace with function body.
