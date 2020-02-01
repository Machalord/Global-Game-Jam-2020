extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func OnClick(position):
	var mapPos = $TileMap.world_to_map(position)
	var id = $TileMap.get_cellv(mapPos)
	match(id):
		1:#sSI ES UN TILE DE BACHE
			if menuSelection == 0 and coins > 10:#SI EN EL MENU SELECCIONAMOS LA REPARACION DE BACHES
				coins -=10
				$TileMap.set_cellv(mapPos,tileMapSelect)
	pass

var tileMapSelect = 0
var coins = 100
var menuSelection = 0

func _input(event):
	if event is InputEventMouseButton:
		self.OnClick(event.position)
