extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.die()
		await SceneTransition.fade_to_black()
		get_tree().change_scene_to_file("res://Scenes/UI/game_over.tscn")
	pass # Replace with function body.
