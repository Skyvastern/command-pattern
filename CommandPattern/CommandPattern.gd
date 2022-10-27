extends Node

export var maze_gen_path: NodePath
onready var maze_gen: MazeGenerator = get_node(maze_gen_path)


func _ready() -> void:
    maze_gen.generate()