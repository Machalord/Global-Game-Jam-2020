extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var menu_seleccion
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$money/Label.text="$"+str(Global.money)


func _on_Button_pressed(current_panel):
	var panels =$panels.get_children()
	
	for i in range($panels.get_children().size()):
		panels[i-1].z_index=20
		get_node("buttons/buttons"+str(i+1)).visible=false
		get_node("buttons/buttons"+str(i+1)).z_index=20
		
		if i==current_panel-1:
			panels[i-1].z_index=30
			get_node("buttons/buttons"+str(i+1)).visible=true
			get_node("buttons/buttons"+str(i+1)).z_index=30
	pass # Replace with function body.
