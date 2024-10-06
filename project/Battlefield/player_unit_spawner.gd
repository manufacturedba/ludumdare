extends Node2D

var unitEnumPlMap;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawnUnit(unitEnumVal: CONSTANTS.CLASS_ENUM):
	var unit = unitEnumPlMap[unitEnumVal].instantiate().with(true);
	unit.global_position = global_position;
	get_tree().current_scene.add_child(unit);

func with(_unitEnumPlMap):
	unitEnumPlMap = _unitEnumPlMap;
	return self;
