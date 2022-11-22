extends Node2D
class_name Player

export var maze_gen_path: NodePath
onready var maze_gen: MazeGenerator = get_node(maze_gen_path)
onready var distance: float = maze_gen.cell_size.x	


func move(dir: Vector2) -> void:
	if _is_collider_ahead(dir):
		return
	
	position += dir * distance


func _is_collider_ahead(dir: Vector2) -> bool:
	var space_state := get_world_2d().direct_space_state
	var result := space_state.intersect_ray(global_position, global_position + (dir * 32))
	return result.size() > 0


func reset() -> void:
	position = Vector2(40, 40)
