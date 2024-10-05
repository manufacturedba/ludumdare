extends Control

var spawnButtonPreload := preload("res://Battlefield/Toolbar/UnitSpawnButton/UnitSpawnButton.tscn");
var health := 0;
var playerUnitTypes := [];

@onready var healthbar = $Healthbar;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	healthbar.value = 100;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	healthbar.value += -1;

func build() -> void:
	for type in self.playerUnitTypes:
		spawnButtonPreload.instantiate().with(spawner);
		
func with(spawner) -> self:
	self.spawner = spawner;
