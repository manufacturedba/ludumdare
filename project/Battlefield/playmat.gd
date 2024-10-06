extends TextureRect

@onready var toolbar = $Toolbar;
@onready var enemyUnitSpawner = $EnemyUnitSpawner;

func with(playerUnitTypes: Array[CONSTANTS.CLASS_ENUM], enemyPattern: Array[CONSTANTS.CLASS_ENUM]):
	toolbar.with(playerUnitTypes);
	enemyUnitSpawner.with(enemyPattern);

func _on_enemy_base_destruction_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menus/Victory.tscn");
