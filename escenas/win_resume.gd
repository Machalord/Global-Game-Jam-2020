extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label2.text="Money = $"+str(Global.money)
	$Label2.text="Happiness = $"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	
	Global.dia+=1
	get_tree().change_scene("res://game.tscn")
	pass # Replace with function body.
