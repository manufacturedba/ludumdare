extends Control

var spawnButtonPreload := preload("res://Battlefield/Toolbar/UnitSpawnButton/UnitSpawnButton.tscn");
var spawnButtons = [];
var playerUnitTypes;
var gold = 2;
var income = 1;

const MAX_GOLD = 99;

var unitDict = {
	CONSTANTS.CLASS_ENUM.SOLDIER: {
		"texture": "res://Battlefield/Toolbar/UnitSpawnButton/Textures/soldier-button-portrait.png",
		"cost": CONSTANTS.SOLDIER_COST,
		"class": CONSTANTS.CLASS_ENUM.SOLDIER
	},
	CONSTANTS.CLASS_ENUM.ARCHER: {
		"texture": "res://Battlefield/Toolbar/UnitSpawnButton/Textures/archer-button-portrait.png",
		"cost": CONSTANTS.ARCHER_COST,
		"class": CONSTANTS.CLASS_ENUM.ARCHER
	},
	CONSTANTS.CLASS_ENUM.CATAPULT: {
		"texture": "res://Battlefield/Toolbar/UnitSpawnButton/Textures/archer-button-portrait.png",
		"cost": CONSTANTS.CATAPULT_COST,
		"class": CONSTANTS.CLASS_ENUM.CATAPULT
	},
	CONSTANTS.CLASS_ENUM.BRUTE: {
		"texture": "res://Battlefield/Toolbar/UnitSpawnButton/Textures/soldier-button-portrait.png",
		"cost": CONSTANTS.BRUTE_COST,
		"class": CONSTANTS.CLASS_ENUM.BRUTE
	},
	CONSTANTS.CLASS_ENUM.SCOUT: {
		"texture": "res://Battlefield/Toolbar/UnitSpawnButton/Textures/soldier-button-portrait.png",
		"cost": CONSTANTS.SCOUT_COST,
		"class": CONSTANTS.CLASS_ENUM.SCOUT
	}
};

@onready var healthbar = $MarginContainer/GridContainer/Healthbar/HealthbarProgress;
@onready var buttonContainer = $MarginContainer/GridContainer/ButtonContainer;
@onready var playerSpawner = $"../PlayerUnitSpawner";
@onready var goldLabel = $"MarginContainer/GridContainer/ResourceContainer/Gold Label";
@onready var goldTimer = $GoldTimer;

# @onready var spawner = $Spawner;

var buttonWidth := 100;
var buttonOffset := 400;

var anything := CONSTANTS.CLASS_ENUM.SOLDIER
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;

func spawn(unit: CONSTANTS.CLASS_ENUM):
	var cost = unitDict[unit].cost;
	if (cost > gold):
		return;
	gold -= cost;
	playerSpawner.spawnUnit(unit);
	updateGold();
	
func with(_playerUnitTypes: Array[CONSTANTS.CLASS_ENUM]):
	playerUnitTypes = _playerUnitTypes;

	for index in range(0, playerUnitTypes.size()):
		var type = playerUnitTypes[index]; # put real type in
		var typeConfig = unitDict[type];
		var spawnButton = spawnButtonPreload.instantiate().with(self, typeConfig)
		spawnButtons.push_back(spawnButton);
		buttonContainer.add_child(spawnButton);
	
	updateGold();
	return self;
	
func updateLifePercent(percent: int) -> void:
	healthbar.value = percent;

func updateGold():
	goldLabel.text = "%d" % gold;
	for button in spawnButtons:
		var unitType = button.unit.class;
		var cost = unitDict[unitType].cost;
		if cost > gold:
			button.disabled = true;
		else:
			button.disabled = false;


func _on_gold_timer_timeout() -> void:
	if (gold >= MAX_GOLD):
		return;
	gold += income;
	updateGold();
