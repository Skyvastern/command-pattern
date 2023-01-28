extends CustomButton
class_name NavigationButton

export var dir: Vector2 = Vector2.ZERO
export var player_path: NodePath
onready var player = get_node(player_path)


func _on_button_down() -> void:
	._on_button_down()
	player.move(dir)
