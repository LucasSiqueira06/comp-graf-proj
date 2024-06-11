extends Node2D

const lines: Array[String] = [
	"Colete todas as amostras antes que o tempo acabe!"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	DialogManager.start_dialog(global_position, lines)
