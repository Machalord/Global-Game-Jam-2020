extends Sprite

var amor = 15
var direction = true
var andar = true
var modelo = 0
var explotar = false
var pago = 0
var dolar=preload("res://dolar.tscn")
var pagado = false
var subirAmor = false
# Called when the node enters the scene tree for the first time.
func _ready():
	frame_coords=Vector2(0,modelo)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if andar:
		$Timer.stop()
		if direction:
			frame_coords.x=0
			position.x -= 1.28 *5
			position.y += 0.64 *5
		else:
			frame_coords.x=1
			position.x += 1.28 *5
			position.y -= 0.64 *5
#	pass
