extends Node2D

@onready var playmat = $Playmat;

const playerUnitTypes: Array[CONSTANTS.CLASS_ENUM] = [
	CONSTANTS.CLASS_ENUM.SOLDIER, 
	CONSTANTS.CLASS_ENUM.ARCHER,
	CONSTANTS.CLASS_ENUM.CATAPULT,
];

const enemyPattern: Array[CONSTANTS.CLASS_ENUM] = [CONSTANTS.CLASS_ENUM.ARCHER, CONSTANTS.CLASS_ENUM.SOLDIER];

func _ready() -> void:
	playmat.with(playerUnitTypes, enemyPattern);
