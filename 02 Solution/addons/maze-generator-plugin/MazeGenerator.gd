tool
extends TileMap
class_name MazeGenerator

const N: int = 1 # 0001
const E: int = 2 # 0010
const S: int = 4 # 0100
const W: int = 8 # 1000

var cell_walls: Dictionary = {
	Vector2(0, -1): N,
	Vector2(1, 0): E,
	Vector2(0, 1): S,
	Vector2(-1, 0): W,
}

# export var map_seed: int = 0
export var width: int = 10
export var height: int = 10
var tile_size: float



func generate() -> void:
	_setup()
	_make_maze()



func _setup() -> void:
	tile_size = cell_size.x

	randomize()	
	# if map_seed == 0:
	# 	map_seed = randi()	
	# seed(map_seed)
	seed(randi())



func _make_maze() -> void:
	var unvisited: Array = []
	var stack: Array = []

	clear()

	for x in range(width):
		for y in range(height):
			unvisited.append(Vector2(x, y))
			set_cellv(Vector2(x,y), N|E|S|W)
	
	var current: Vector2 = Vector2.ZERO
	unvisited.erase(current)

	while unvisited:
		var unvisited_neighbours: Array = _get_unvisited_neighbours(current, unvisited)
		
		if unvisited_neighbours.size() > 0:
			var next: Vector2 = unvisited_neighbours[randi() % unvisited_neighbours.size()]
			stack.append(next)

			var dir: Vector2 = next - current
			var current_walls = get_cellv(current) - cell_walls[dir]
			var next_walls = get_cellv(next) - cell_walls[-dir]
			set_cellv(current, current_walls)
			set_cellv(next, next_walls)
			
			current = next
			unvisited.erase(current)

		elif stack:
			current = stack.pop_back()



func _get_unvisited_neighbours(cell: Vector2, all_unvisited: Array) -> Array:
	var unvisited: Array = []
	for n in cell_walls.keys():
		if cell + n in all_unvisited:
			unvisited.append(cell + n)
	
	return unvisited