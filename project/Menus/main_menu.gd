extends Control

@onready var level1Button = $MarginContainer/VBoxContainer/Level1;
@onready var level2Button = $MarginContainer/VBoxContainer/Level2;
@onready var level3Button = $MarginContainer/VBoxContainer/Level3;
@onready var level4Button = $MarginContainer/VBoxContainer/Level4;
@onready var level5Button = $MarginContainer/VBoxContainer/Level5;
@onready var menuSelectAudioStreamPlayer = $MenuSelectAudioStreamPlayer;
@onready var levelSelectTimer = $LevelSelectTimer;

var levelResource: String;

func _ready() -> void:
	level1Button.disabled = ProgressionService.checkLevelDisabled(1);
	level2Button.disabled = ProgressionService.checkLevelDisabled(2);
	level3Button.disabled = ProgressionService.checkLevelDisabled(3);
	level4Button.disabled = ProgressionService.checkLevelDisabled(4);
	level5Button.disabled = ProgressionService.checkLevelDisabled(5);

func _on_level_1_pressed() -> void:
	menuSelectAudioStreamPlayer.play();
	levelResource = "res://Levels/Level1.tscn";
	levelSelectTimer.start();

func _on_level_2_pressed() -> void:
	menuSelectAudioStreamPlayer.play();
	levelResource = "res://Levels/Level2.tscn";
	levelSelectTimer.start();

func _on_level_3_pressed() -> void:
	menuSelectAudioStreamPlayer.play();
	levelResource = "res://Levels/Level3.tscn";
	levelSelectTimer.start();

func _on_level_4_pressed() -> void:
	menuSelectAudioStreamPlayer.play();
	levelResource = "res://Levels/Level4.tscn";
	levelSelectTimer.start();

func _on_level_5_pressed() -> void:
	menuSelectAudioStreamPlayer.play();
	levelResource = "res://Levels/Level5.tscn";
	levelSelectTimer.start();

func _on_exit_button_pressed() -> void:
	get_tree().quit();


func _on_level_select_timer_timeout() -> void:
	get_tree().change_scene_to_file(levelResource);
