extends VBoxContainer

export var new_game_path: NodePath
export var undo_path: NodePath
export var redo_path: NodePath

onready var new_game: CustomButton = get_node(new_game_path)
onready var undo: CustomButton = get_node(undo_path)
onready var redo: CustomButton = get_node(redo_path)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("new_game"):
		new_game.emit_signal("press")
	elif Input.is_action_just_pressed("undo"):
		undo.emit_signal("press")
	elif Input.is_action_just_pressed("redo"):
		redo.emit_signal("press")
