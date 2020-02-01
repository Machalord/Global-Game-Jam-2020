extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tilemap

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _process(delta):
	tilemap=get_node("../TileMap")
	var pos
	pos=tilemap.world_to_map(get_local_mouse_position())
	var pos2=tilemap.map_to_world(pos)
#	print(pos)
#	pos2.x=pos2.x*$TileMap.cell_size.x
#	pos2.y=pos2.y*$TileMap.cell_size.x
	print(pos)
	$Sprite.global_position=pos2+Vector2(-128,0)
