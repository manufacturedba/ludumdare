extends Control

var unit;
var spawner: String;

@onready var unitTypeTexture := $UnitTypeTexture;

var soldierTexture = load("res://Battlefield/Toolbar/UnitSpawnButton/Textures/soldier.png")
var archerTexture = load("res://Battlefield/Toolbar/UnitSpawnButton/Textures/archer.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func with(_spawner, _unit):
	spawner = _spawner;
	unit = _unit;
	
	unitTypeTexture.texture = unit.texture;
	return self;
	
func _on_pressed() -> void:
	pass # Replace with function body.
