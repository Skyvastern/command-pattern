extends VBoxContainer

export var up_path: NodePath
export var down_path: NodePath
export var right_path: NodePath
export var left_path: NodePath

onready var up: NavigationButton = get_node(up_path)
onready var down: NavigationButton = get_node(down_path)
onready var right: NavigationButton = get_node(right_path)
onready var left: NavigationButton = get_node(left_path)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		up.emit_signal("button_down")
	elif Input.is_action_just_released("ui_up"):
		up.emit_signal("button_up")
		
	elif Input.is_action_just_pressed("ui_down"):
		down.emit_signal("button_down")
	elif Input.is_action_just_released("ui_down"):
		down.emit_signal("button_up")
		
	elif Input.is_action_just_pressed("ui_right"):
		right.emit_signal("button_down")
	elif Input.is_action_just_released("ui_right"):
		right.emit_signal("button_up")
		
	elif Input.is_action_just_pressed("ui_left"):
		left.emit_signal("button_down")
	elif Input.is_action_just_released("ui_left"):
		left.emit_signal("button_up")
