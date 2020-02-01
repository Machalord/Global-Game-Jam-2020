extends Node

var mapPosition
var cataclismo
var tilemap

func _ready():
	tilemap = get_node("/root/game/TileMap")
	RandoRandomizer()
	pass # Replace with function body.

func RandoRandomizer():
	var rand1 = rand_range(0,1000);
	if rand1 > 990:
		cataclismo = rand_range(10,rand_range(11,2000));
	elif rand1 > 900:
		cataclismo = rand_range(10,1000);
	elif rand1 > 500:
		cataclismo = rand_range(10,600);
	else:
		cataclismo = rand_range(10, 300);

func Comparar(pos):
	return pos.x == mapPosition.x and pos.y == mapPosition.y

func Iniciar(posX,posY):
	mapPosition = Vector2(posX,posY)

func SetTipoTile(tipo):
	RandoRandomizer()
	tilemap.set_cellv(mapPosition,tipo)

func _process(delta):
	var tipoTile = tilemap.get_cellv(mapPosition)
	if tipoTile != TileTipe.pasto:
		if cataclismo >= 0:
			cataclismo -= rand_range( 0, 10 ) * delta
		elif tipoTile != TileTipe.bache and tipoTile != TileTipe.despintado:
			if rand_range(0,100) > 50:
				tilemap.set_cellv(mapPosition,TileTipe.bache)
			else:
				tilemap.set_cellv(mapPosition,TileTipe.despintado)
	pass

enum TileTipe{
	normal = 0,
	bache = 1,
	despintado = 2,
	pasto = 3,
	tierra = 4
}
