extends Area2D


@onready var animation_player = $AnimationPlayer
var first_scene_path = "res://Scenes/Hub.tscn"

func _on_body_entered(body):
	var tree = get_tree()
	if body is CharacterBody2D:
		print("Voce coletou o PurpleIngot")
		body.collect_purple_ingot()
		animation_player.play("pickup")
		tree.change_scene_to_file(first_scene_path)
