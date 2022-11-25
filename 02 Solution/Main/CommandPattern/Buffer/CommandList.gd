extends Node

var _undo_array: Array = []
var _redo_array: Array = []


func run(command: BaseCommand) -> void:
	add_child(command)
	command.execute()
	_undo_array.append(command)
	_empty_redo()


func undo_command() -> BaseCommand:
	var command: BaseCommand = _undo_array.pop_back()

	if command != null:
		_redo_array.append(command)
		command.unexecute()

	return command

func redo_command() -> BaseCommand:
	var command: BaseCommand = _redo_array.pop_back()

	if command != null:
		_undo_array.append(command)
		command.execute()

	return command


func _empty_undo() -> void:
	for c in _undo_array:
		c.queue_free()
	
	_undo_array.clear()


func _empty_redo() -> void:
	for c in _redo_array:
		c.queue_free()
	
	_redo_array.clear()


func reset_queues() -> void:
	_empty_undo()
	_empty_redo()
