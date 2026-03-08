extends Control

@onready var start_play: Button = $"MarginContainer/Panel/MarginContainer/VBoxContainer/Start-Play"
@onready var quit_eject: Button = $"MarginContainer/Panel/MarginContainer/VBoxContainer/Quit-Eject"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_play.pressed.connect(_start_game)
	quit_eject.pressed.connect(_quit_game)
	pass # Replace with function body.

func _quit_game() -> void:
	get_tree().quit()

func _start_game() -> void:
	get_tree().change_scene_to_file("res://Scenes/week_4_work.tscn")
	pass
