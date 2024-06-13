extends TextureButton

var venus := "res://Scenes/Venus.tscn"

# The scale factor to apply when the mouse is over the button
@export var hover_scale: Vector2 = Vector2(0.5, 0.5)
# The original scale of the button (to revert back when the mouse leaves)
var original_scale: Vector2

func _ready():
	# Save the original scale of the button
	original_scale = scale
	# Connect the signals
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _on_mouse_entered():
	# Scale up the button when the mouse enters
	scale = hover_scale

func _on_mouse_exited():
	# Revert back to the original scale when the mouse exits
	scale = original_scale

func _pressed():
	var tree = get_tree()
	tree.change_scene_to_file(venus)
