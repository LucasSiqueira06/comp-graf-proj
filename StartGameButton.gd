extends MenuButton

var first_scene_path := "res://Scenes/main.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _pressed():
	var tree = get_tree()
	
	tree.change_scene_to_file(first_scene_path)

