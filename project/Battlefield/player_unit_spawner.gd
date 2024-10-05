extends Node2D

const plSoldier = preload("res://Units/Soldier.tscn");

const unitEnumPlMap = {
	CONSTANTS.CLASS_ENUM.SOLDIER: plSoldier
}

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

#TODO: Delete this and also the timer
func _on_player_unit_spawn_timer_timeout() -> void:
	spawnUnit(CONSTANTS.CLASS_ENUM.SOLDIER);
