extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed(current_panel):
	var panels =$panels.get_children()
	for i in range($panels.get_children().size()):
		panels[i-1].z_index=20
		if i==current_panel:
			panels[i-1].z_index=30
	pass # Replace with function body.
