extends Sprite

var mapaPos
func SetPosicion(pos):
	mapaPos = pos

func GetMapaPos():
	return mapaPos

var duration = 3

func _process(delta):
	duration -= delta
	if duration < 0:
		var tilemap = get_node("/root/game/TileMap")
		tilemap.set_cellv(mapaPos,0)
		get_parent().queue_free()
