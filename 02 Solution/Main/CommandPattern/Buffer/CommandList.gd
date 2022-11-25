extends Node

var _undo_queue: Array = []
var _redo_queue: Array = []


func run(command: BaseCommand) -> void:
	add_child(command)
	command.execute()
	_undo_queue.append(command)
	_empty_redo()


func undo_command() -> BaseCommand:
	var command: BaseCommand = _undo_queue.pop_back()

	if command != null:
		_redo_queue.append(command)
		command.unexecute()

	return command

func redo_command() -> BaseCommand:
	var command: BaseCommand = _redo_queue.pop_back()

	if command != null:
		_undo_queue.append(command)
		command.execute()

	return command


func _empty_undo() -> void:
	for c in _undo_queue:
		c.queue_free()
	
	_undo_queue.clear()


func _empty_redo() -> void:
	for c in _redo_queue:
		c.queue_free()
	
	_redo_queue.clear()


func reset_queues() -> void:
	_empty_undo()
	_empty_redo()
