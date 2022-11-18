extends Node

export var maze_gen_path: NodePath
onready var maze_gen: MazeGenerator = get_node(maze_gen_path)
export var player_path: NodePath
onready var player: Player = get_node(player_path)


func _ready() -> void:
	new_game()


func new_game() -> void:
	maze_gen.generate()
	player.reset()

func undo_command() -> void:
	var _command: BaseCommand = CommandQueue.undo_command()

func redo_command() -> void:
	var _command: BaseCommand = CommandQueue.redo_command()
