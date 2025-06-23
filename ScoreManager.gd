extends Node

var scores: Array = []

const SAVE_PATH = "user://scores.save"
const MAX_ENTRIES = 10

func add_score(value: float) -> void:
	scores.append(value)
	scores.sort()
	scores.reverse()  # de mayor a menor
	scores = scores.slice(0, MAX_ENTRIES)
	save_scores()

func save_scores():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(scores)

func load_scores():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		scores = file.get_var()
	else:
		scores = []
