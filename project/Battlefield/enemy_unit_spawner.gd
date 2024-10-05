extends Node2D

@onready var timer = $EnemyUnitSpawnTimer;
const plSoldier = preload("res://Units/Soldier.tscn");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_enemy_unit_spawn_timer_timeout() -> void:
	var soldier: Area2D = plSoldier.instantiate().with(false);
	soldier.global_position = global_position;
	get_tree().current_scene.add_child(soldier);
