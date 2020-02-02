extends Sprite

var mapaPos
func SetPosicion(pos):
	mapaPos = pos

func GetMapaPos():
	return mapaPos

var duration = 10

func _process(delta):
	duration -= delta
	if duration < 0:
		var tilemap = get_node("/root/game/TileMap")
		tilemap.SetNodeTipe(mapaPos,5)
		get_parent().queue_free()
