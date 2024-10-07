extends Node2D

@onready var timer:Timer = $EnemyUnitSpawnTimer;

var pattern: Array[CONSTANTS.CLASS_ENUM] = [CONSTANTS.CLASS_ENUM.SOLDIER];
var patternIdx := 0;
var unitEnumPlMap;

func with(_pattern: Array[CONSTANTS.CLASS_ENUM], _unitEnumPlMap):
	pattern = _pattern;
	unitEnumPlMap = _unitEnumPlMap;
	return self;

func _on_enemy_unit_spawn_timer_timeout() -> void:
	patternIdx = (patternIdx+1) % pattern.size();
	var unitEnumVal = pattern[patternIdx];
	spawnUnit(unitEnumVal);
	timer.start(4);

func spawnUnit(unitEnumVal: CONSTANTS.CLASS_ENUM):
	var unit = unitEnumPlMap[unitEnumVal].instantiate().with(false);
	unit.global_position = global_position;
	get_tree().current_scene.add_child(unit);
