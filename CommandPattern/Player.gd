extends Node2D
class_name Player

export var maze_gen_path: NodePath
onready var maze_gen: MazeGenerator = get_node(maze_gen_path)
onready var distance: float = maze_gen.cell_size.x


func _process(_delta: float) -> void:
    var dir: Vector2

    if Input.is_action_just_pressed("ui_up"):
        dir = Vector2(0, -1)
    if Input.is_action_just_pressed("ui_down"):
        dir = Vector2(0, 1)
    if Input.is_action_just_pressed("ui_right"):
        dir = Vector2(1, 0)
    if Input.is_action_just_pressed("ui_left"):
        dir = Vector2(-1, 0)
    
    move(dir)


func move(dir: Vector2) -> void:
    position += dir * distance