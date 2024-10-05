extends Control

var classes = CONSTANTS.CLASS_ENUM;
var health := 100;
var playerUnitTypes = [classes.SOLDIER, classes.ARCHER];

@onready var toolbar = $Toolbar;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toolbar.with(playerUnitTypes, health);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
