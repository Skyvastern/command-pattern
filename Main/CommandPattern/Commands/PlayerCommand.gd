extends BaseCommand
class_name PlayerCommand

var player: Player
var direction: Vector2
var magnitude: float


func execute() -> void:
	player.position += direction * magnitude

func unexecute() -> void:
	player.position -= direction * magnitude
