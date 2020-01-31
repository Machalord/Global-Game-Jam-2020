extends Sprite


export var direction = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction:
		position.x -= 1.28 *5
		position.y += 0.64 *5
	else:
		position.x += 1.28 *5
		position.y -= 0.64 *5
#	pass
