extends Sprite

var mapaPos
func SetPosicion(pos):
	mapaPos = pos

func GetMapaPos():
	return mapaPos

var duration = 100

func _process(delta):
	duration -= delta
	if duration < 0:

		get_parent().queue_free()
