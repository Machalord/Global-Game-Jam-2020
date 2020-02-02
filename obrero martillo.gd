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
		if tilemap.get_cellv(mapaPos) == 5:
			tilemap.SetNodeTipe(mapaPos,0)
		get_parent().queue_free()
