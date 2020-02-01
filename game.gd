extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var aplanadoraInstance = load("res://aplanadora.tscn")
var volcadorInstance = load("res://volcador.tscn")
var conoInstance = load("res://cono.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("MouseLeftClick"):
		OnClick(get_global_mouse_position())
	pass

func OnClick(position):
	var mapPos = $TileMap.world_to_map(position)
	var id = $TileMap.get_cellv(mapPos)
	
	var ocupado = false;
	for n in get_tree().get_nodes_in_group("Ocupados"):
		if n.GetMapaPos() == mapPos:
			ocupado = true
			break
	
	match(id):
		0:#ES UN TILE NORMAL
			if not ocupado and menuSelection == 0 and coins > 10:#SI EN EL MENU SELECCIONAMOS LA REPARACION DE BACHES
				coins -=10
				var spawn = conoInstance.instance()
				spawn.position = $TileMap.map_to_world(mapPos) + Vector2(0,64)
				spawn.get_child(0).SetPosicion(mapPos)
				add_child(spawn)
		1:#sSI ES UN TILE DE BACHE
			if not ocupado and menuSelection == 0 and coins > 10:#SI EN EL MENU SELECCIONAMOS LA REPARACION DE BACHES
				coins -=10
				var spawn = aplanadoraInstance.instance()
				spawn.position = $TileMap.map_to_world(mapPos) + Vector2(0,64)
				spawn.get_child(0).SetPosicion(mapPos)
				add_child(spawn)
		2:#SI ES UN TILE DESPINTADO
			if not ocupado and menuSelection == 0 and coins > 10:#SI EN EL MENU SELECCIONAMOS LA REPARACION DE BACHES
				coins -=10
				var spawn = volcadorInstance.instance()
				spawn.position = $TileMap.map_to_world(mapPos) + Vector2(0,64)
				spawn.get_child(0).SetPosicion(mapPos)
				add_child(spawn)
	pass

var tileMapSelect = 0
var coins = 100
var menuSelection = 0

