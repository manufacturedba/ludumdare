extends Control

var unit;
var spawner;

@onready var unitTypeTexture := $UnitTypeTexture;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var texture = load(unit.texture)
	unitTypeTexture.texture = texture;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func with(_spawner, _unit):
	spawner = _spawner;
	unit = _unit;
	
	return self;
	
func _on_pressed() -> void:
	spawner.spawn(unit.class);
