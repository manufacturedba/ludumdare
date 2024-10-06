extends TextureRect

@onready var toolbar = $Toolbar;
@onready var enemyUnitSpawner = $EnemyUnitSpawner;
@onready var playerUnitSpawner = $PlayerUnitSpawner;

const plSoldier = preload("res://Units/Soldier.tscn");
const plArcher = preload("res://Units/Archer.tscn");
const plCatapult = preload("res://Units/Catapult.tscn");
const plBrute = preload("res://Units/Brute.tscn");
const plScout = preload("res://Units/Scout.tscn");

const unitEnumPlMap = {
	CONSTANTS.CLASS_ENUM.SOLDIER: plSoldier,
	CONSTANTS.CLASS_ENUM.ARCHER: plArcher,
	CONSTANTS.CLASS_ENUM.CATAPULT: plCatapult,
	CONSTANTS.CLASS_ENUM.BRUTE: plBrute,
	CONSTANTS.CLASS_ENUM.SCOUT: plScout,
}

func with(playerUnitTypes: Array[CONSTANTS.CLASS_ENUM], enemyPattern: Array[CONSTANTS.CLASS_ENUM]):
	toolbar.with(playerUnitTypes);
	playerUnitSpawner.with(unitEnumPlMap);
	enemyUnitSpawner.with(enemyPattern, unitEnumPlMap);

func _on_enemy_base_destruction_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menus/Victory.tscn");

func _on_player_base_destruction_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menus/Defeat.tscn");
