extends TextureButton
class_name CustomButton


const BLEND = 0.2


func _ready() -> void:
	var _c1 = self.connect("button_up", self, "_on_button_up")
	var _c2 = self.connect("button_down", self, "_on_button_down")


func _on_button_up() -> void:
	$AnimationPlayer.play("Idle", BLEND)

func _on_button_down() -> void:
	$AnimationPlayer.play("Pressed", BLEND)
