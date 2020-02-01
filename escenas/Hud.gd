extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var show=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$money_label.text="$"+str(Global.money)
#	if get_global_mouse_position().y>position.y+700 and !show:
#		$AnimationPlayer.play("show")
#		show=true
#	if get_global_mouse_position().y<position.y+550 and show:
#		$AnimationPlayer.play("hide")
#		show=false	
		
	pass

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

#
#func _on_panel_control_mouse_entered():
#	print("sss")
#	if show: 
#		$AnimationPlayer.play("hide")
#		show=false
#	pass # Replace with function body.
#
#
#func _on_panel_control_mouse_exited():
#	if !show: 
#		$AnimationPlayer.play("show")
#		show=true	
#	pass # Replace with function body.
