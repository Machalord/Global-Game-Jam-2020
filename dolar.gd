extends Node2D


var tween
var llamarTween = false
var alpha = 1.2
var desvanecer=false
var posaux
# Called when the node enters the scene tree for the first time.
func _ready():
	tween = get_node("Tween") 
	posaux=Vector2(position.x,position.y-50)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !llamarTween:
		tween.interpolate_property(self, "position",position, posaux, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.start()
		desvanecer=true
		llamarTween = true
	if desvanecer:
		alpha -= 0.02
		modulate.a = alpha
			

#	pass
