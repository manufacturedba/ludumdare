extends Control

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level1.tscn");

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level2.tscn");

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level3.tscn");

func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level4.tscn");

func _on_level_5_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/Level5.tscn");

func _on_exit_button_pressed() -> void:
	get_tree().quit();
