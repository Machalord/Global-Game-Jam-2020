extends Node2D


var tween
var llamarTween = false
var alpha = 2
var desvanecer=false
# Called when the node enters the scene tree for the first time.
func _ready():
	tween = get_node("Tween") 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !llamarTween:
		tween.interpolate_property(self, "position",position, $Position2D.position, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.start()
		desvanecer=true
		llamarTween = true
	if desvanecer:
		alpha -= 0.01
		modulate.a = alpha
			

#	pass
