extends Node2D
class_name Player

export var maze_gen_path: NodePath
onready var maze_gen: MazeGenerator = get_node(maze_gen_path)
onready var distance: float = maze_gen.cell_size.x

export var command_scene: PackedScene	


func move(dir: Vector2) -> void:
	if _is_collider_ahead(dir):
		return

	var command = command_scene.instance()
	command.player = self
	command.direction = dir
	command.magnitude = distance

	CommandQueue.execute(command)


func _is_collider_ahead(dir: Vector2) -> bool:
	var space_state := get_world_2d().direct_space_state
	var result := space_state.intersect_ray(global_position, global_position + (dir * 32))
	return result.size() > 0


func reset() -> void:
	position = Vector2(40, 40) # Will make this automatic later
	CommandQueue.reset_queues()
