extends Button

export var dir: Vector2
export var player_path: NodePath
onready var player: Player = get_node(player_path)

func _on_NavigationBTN_pressed() -> void:
	player.move(dir)
