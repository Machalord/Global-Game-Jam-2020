extends Node2D

var aplanadoraInstance = load("res://aplanadora.tscn")
var volcadorInstance = load("res://volcador.tscn")
var conoInstance = load("res://cono.tscn")
var pintadoraInstance =load("res://laQuePinta.tscn")
var obreromartilloInstance=load("res://obrero martillo.tscn")
var obrerocarretillaInstance=load("res://obrero caretilla.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.money = 500
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CameraControl/Hud/time_label.text=String(int(20-$Timer.time_left/10))+":00"
	$CameraControl/Hud/day_label.text=String(Global.dia)
	print(get_tree().get_nodes_in_group("auto").size())
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
	
	if not ocupado:
		if Global.herramienta == Herramienta.cono and Global.money > 1 and Global.actionTimer < 0:
			var hayCono = false;
			for n in get_tree().get_nodes_in_group("Conos"):
				if n.isMouseOver() :
					hayCono = true
					break
			if(!hayCono):
				Global.money -=1
				Global.actionTimer = 0.2
				var spawn = conoInstance.instance()
				spawn.position = position
				add_child(spawn)
				
		if Global.herramienta == Herramienta.obreroBaila and Global.money > 50 and Global.actionTimer < 0:
				Global.money -=50
				Global.actionTimer = 0.2
				var spawn = conoInstance.instance()
				spawn.position = position
				add_child(spawn)		
		else:
			match(id):
				1:#SI ES UN TILE DE BACHE
					if Global.herramienta == Herramienta.obreroCarretilla and Global.money > 10:#SI EN EL MENU SELECCIONAMOS LA REPARACION DE BACHES
						Global.money -=10
						Global.actionTimer = 0.2
						var spawn = obrerocarretillaInstance.instance()
						spawn.position = $TileMap.map_to_world(mapPos) + Vector2(0,64)
						spawn.get_child(0).SetPosicion(mapPos)
						add_child(spawn)	
						
					if Global.herramienta == Herramienta.volcador and Global.money > 10:#SI EN EL MENU SELECCIONAMOS LA REPARACION DE BACHES
						Global.money -=50
						Global.actionTimer = 0.2
						var spawn = volcadorInstance.instance()
						spawn.position = $TileMap.map_to_world(mapPos) + Vector2(0,64)
						spawn.get_child(0).SetPosicion(mapPos)
						add_child(spawn)
					if Global.herramienta == Herramienta.obreroAplanador and Global.money > 10:#SI EN EL MENU SELECCIONAMOS LA REPARACION DE BACHES
						Global.money -=10
						Global.actionTimer = 0.2
						var spawn = obreromartilloInstance.instance()
						spawn.position = $TileMap.map_to_world(mapPos) + Vector2(0,64)
						spawn.get_child(0).SetPosicion(mapPos)
						add_child(spawn)	
				2:#SI ES UN TILE DESPINTADO
					if Global.herramienta == Herramienta.pintadora and Global.money > 10:#SI EN EL MENU SELECCIONAMOS LA REPARACION DE BACHES
						Global.money -=50
						Global.actionTimer = 0.2
						var spawn = pintadoraInstance.instance()
						spawn.position = $TileMap.map_to_world(mapPos) + Vector2(0,64)
						spawn.get_child(0).SetPosicion(mapPos)
						add_child(spawn)
	pass

enum TileTipe{
	normal = 0,
	bache = 1,
	despintado = 2,
	pasto = 3,
	tierra = 4
}

enum Herramienta{
	obreroAplanador = 1,
	aplanadoraRapida = 2,
	pintadora = 3,
	cono = 4,
	volcador = 5
	obreroCarretilla=6
	obreroBaila=7
}


func _on_Timer_timeout():

	pass # Replace with function body.
