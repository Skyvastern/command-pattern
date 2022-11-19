extends CustomButton
class_name NavigationButton

export var dir: Vector2 = Vector2.ZERO
export var player_path: NodePath
onready var player = get_node(player_path)

func _ready() -> void:
    var _c1 = self.connect("press", self, "_on_button_press")

func _on_button_press() -> void:
    player.move(dir)