extends Sprite

var direction = true
var cont = 0
func _process(delta):
	if direction:
		cont+=1
		position.x -= 1.28/2
		position.y += 0.64/2
	else:
		cont+=1
		position.x += 1.28/2
		position.y -= 0.64/2
	if cont == 50:
		cont=0
		if direction:
			direction=false
		else:
			direction=true
