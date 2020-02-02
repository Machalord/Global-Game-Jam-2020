extends TileMap

var instancia = load("res://nodoTile.tscn")

func _ready():
	for asd in get_used_cells():
		var spawn = instancia.instance()
		add_child(spawn)
		spawn.Iniciar(asd.x,asd.y)
	pass

func SetNodeTipe(pos,tipo):
	for asd in get_children():
		if asd.Comparar(pos):
			asd.SetTipoTile(tipo)

func EstaMalHecho(posicion):
	var val = get_cellv( world_to_map(posicion))
	print(val)
	return val != 0 

