extends Node2D
class_name Player

export var maze_gen_path: NodePath
onready var maze_gen: MazeGenerator = get_node(maze_gen_path)
onready var distance: float = maze_gen.cell_size.x

export var command_scene: PackedScene
export var queue_path: NodePath
onready var queue: CommandQueue = get_node(queue_path)


func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("ui_up"):
        move(Vector2(0, -1))
    if Input.is_action_just_pressed("ui_down"):
        move(Vector2(0, 1))
    if Input.is_action_just_pressed("ui_right"):
        move(Vector2(1, 0))
    if Input.is_action_just_pressed("ui_left"):
        move(Vector2(-1, 0))
    
    if Input.is_action_just_pressed("ui_accept"):
        var command = command_scene.instance()
        add_child(command)


func move(dir: Vector2) -> void:
    var command = command_scene.instance()
    command.player = self
    command.direction = dir
    command.magnitude = distance

    queue.execute(command)