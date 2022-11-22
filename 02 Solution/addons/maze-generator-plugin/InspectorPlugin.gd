tool
extends EditorInspectorPlugin


var current_object: MazeGenerator


func can_handle(object: Object) -> bool:
    if object is MazeGenerator:
        current_object = object
        return true
    
    return false


func parse_begin(_object: Object) -> void:
    var gen_btn: Button = Button.new()
    gen_btn.set_text("Generate")
    var _result = gen_btn.connect("pressed", self, "_on_button_press")

    add_custom_control(gen_btn)


func _on_button_press() -> void:
    print(current_object.name + ": Generating maze...")
    current_object.generate()