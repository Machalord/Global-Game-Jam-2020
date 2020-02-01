extends Sprite


export var direction = true
var andar = true
var modelo
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	modelo=int(rand_range(0,5))
	print(modelo)
	frame_coords=Vector2(0,modelo)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if andar:
		if direction:
			frame_coords.x=0
			position.x -= 1.28 *5
			position.y += 0.64 *5
		else:
			frame_coords.y=1
			position.x += 1.28 *5
			position.y -= 0.64 *5
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("cono"):
		andar=false
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	if area.is_in_group("cono"):
		andar=true
	pass # Replace with function body.
