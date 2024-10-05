extends Control

var spawnButton := preload("res://Battlefield/Toolbar/UnitSpawnButton/UnitSpawnButton.tscn");

var health := 0;
var playerUnitTypes := [];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func build() -> void:
	for type in self.playerUnitTypes:
		spawnButton.instantiate();
		
