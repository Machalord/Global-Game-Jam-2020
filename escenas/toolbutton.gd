extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var price=0
export (int) var tool_id=0
export (Texture) var texture
# Called when the node enters the scene tree for the first time.
func _ready():
	$label_price.text="$"+str(price)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button_pressed():
	Global.herramienta=tool_id
	pass # Replace with function body.
