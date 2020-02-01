extends Sprite


var direction = true
var andar = true
var modelo
# Called when the node enters the scene tree for the first time.
func _ready():

	if direction:
			$Area2D/CollisionShape2D.add_to_group("adelanteauto")
			$Area2D2/CollisionShape2D2.add_to_group("atrasauto")
	else:
			$Area2D/CollisionShape2D.add_to_group("atrasauto")
			$Area2D2/CollisionShape2D2.add_to_group("adelanteauto")
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
			frame_coords.x=1
			position.x += 1.28 *5
			position.y -= 0.64 *5
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("cono") or area.is_in_group("auto"):
		andar=false
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	if area.is_in_group("cono") or area.is_in_group("auto"):
		andar=true
	pass # Replace with function body.
