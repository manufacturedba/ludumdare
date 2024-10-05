extends Control

var classes = CONSTANTS.CLASS_ENUM;

var spawnButtonPreload := preload("res://Battlefield/Toolbar/UnitSpawnButton/UnitSpawnButton.tscn");
var health := 0;
var playerUnitTypes := [classes.SOLDIER, classes.ARCHER];
var spawnButtons := [];

var unitDict = {
	[classes.SOLDIER]: {
		"texture": "res://Battlefield/Toolbar/UnitSpawnButton/Textures/soldier.png",
		"cost": 1,
	},
	[classes.ARCHER]: {
		"texture": "res://Battlefield/Toolbar/UnitSpawnButton/Textures/archer.png",
		"cost": 2.
	},
}

@onready var healthbar = $Healthbar;
# @onready var spawner = $Spawner;

var buttonWidth := 100;
var buttonOffset := 10;

var anything := CONSTANTS.CLASS_ENUM.SOLDIER
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	healthbar.value = 100;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#healthbar.value += -1;
	pass;

func with(playerUnitTypes):
	var startingPosition := Vector2(0, 0);
	for index in range(0, playerUnitTypes.length()):
		var spawnButton := spawnButtonPreload.instantiate()
		var type = playerUnitTypes[index]; # put real type in
		var typeConfig = unitDict[type];
		# .with(spawner, typeConfig);
		# spawnbutton.position = Vector(buttonWidth * index + offset);
		spawnButtons.push_back(spawnButton);
		get_tree().current_scene.add_child(spawnButton);
		
	return self;

func update(health, resource):
	for button in spawnButtons:
		var unitType := button.unit.type;
		var cost := unitDict[unitType].cost;
		if cost > resource:
			button.disabled = true;
