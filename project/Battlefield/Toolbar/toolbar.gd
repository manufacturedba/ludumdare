extends Control

var classes = CONSTANTS.CLASS_ENUM;

var spawnButtonPreload := preload("res://Battlefield/Toolbar/UnitSpawnButton/UnitSpawnButton.tscn");
var health := 0;
var spawnButtons = [];
var playerUnitTypes;

var unitDict = {
	classes.SOLDIER: {
		"texture": "res://Battlefield/Toolbar/UnitSpawnButton/Textures/soldier.png",
		"cost": 1,
	},
	classes.ARCHER: {
		"texture": "res://Battlefield/Toolbar/UnitSpawnButton/Textures/archer.png",
		"cost": 2.
	},
}

@onready var healthbar = $Healthbar;
@onready var buttonContainer = $MarginContainer/GridContainer/ButtonContainer;
# @onready var spawner = $Spawner;


var buttonWidth := 100;
var buttonOffset := 10;

var anything := CONSTANTS.CLASS_ENUM.SOLDIER
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#healthbar.value += -1;
	pass;

func with(_playerUnitTypes: Array, _health: int):
	playerUnitTypes = _playerUnitTypes;
	health = _health;
	var startingPosition := Vector2(0, 0);

	for index in range(0, playerUnitTypes.size()):
		var spawnButton = spawnButtonPreload.instantiate()
		var type = playerUnitTypes[index]; # put real type in
		var typeConfig = unitDict[type];
		# .with(spawner, typeConfig);
		spawnButton.position = Vector2(buttonWidth * index + buttonOffset, 0);
		spawnButtons.push_back(spawnButton);
		buttonContainer.add_child(spawnButton);
		
	return self;

func update(health, resource):
	
	for button in spawnButtons:
		var unitType = button.unit.type;
		var cost = unitDict[unitType].cost;
		if cost > resource:
			button.disabled = true;
