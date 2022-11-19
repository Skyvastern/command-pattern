extends Control

var is_mouse_inside: bool = false
const BLEND = 0.2


func _ready() -> void:
    var _c1 = self.connect("mouse_entered", self, "_on_mouse_enter")
    var _c2 = self.connect("mouse_exited", self, "_on_mouse_exit")


func _input(event: InputEvent) -> void:
    if is_mouse_inside and event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT and event.pressed:
            print("Left button was clicked at ", event.position)
            $AnimationPlayer.play("Pressed", BLEND)
            $AnimationPlayer.play("Highlight", BLEND)


func _on_mouse_enter() -> void:
    is_mouse_inside = true
    $AnimationPlayer.play("Highlight", BLEND)

func _on_mouse_exit() -> void:
    is_mouse_inside = false
    $AnimationPlayer.play("Idle", BLEND)