extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	AudioServer.set_bus_volume_db(0,$optionsmenu/volumeslider.value)
	pass


func _on_newgame_pressed():
	get_tree().change_scene("res://game.tscn")


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_SilenceMusic_pressed():
	AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
	pass # Replace with function body.


func _on_back_pressed():
	$menu.visible=true
	$optionsmenu.visible=false
	pass # Replace with function body.


func _on_options_pressed():
	$menu.visible=false
	$optionsmenu.visible=true
	pass # Replace with function body.
