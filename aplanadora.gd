extends Sprite

var direction = true
var cont = 0

var duration = 3
var mapaPos

func SetPosicion(pos):
	mapaPos = pos

func GetMapaPos():
	return mapaPos

func _process(delta):
	duration -= delta
	if duration < 0:
		var tilemap = get_node("/root/game/TileMap")
		tilemap.SetNodeTipe(mapaPos,0)
		get_parent().queue_free()
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
