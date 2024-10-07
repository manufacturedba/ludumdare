extends Node2D

var unitEnumPlMap;

func spawnUnit(unitEnumVal: CONSTANTS.CLASS_ENUM):
	var unit = unitEnumPlMap[unitEnumVal].instantiate().with(true);
	unit.global_position = global_position;
	get_tree().current_scene.add_child(unit);

func with(_unitEnumPlMap):
	unitEnumPlMap = _unitEnumPlMap;
	return self;
