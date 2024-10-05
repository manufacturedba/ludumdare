extends Node2D

var health := 100;
var playerUnitTypes := ['a', 'b'];
var toolbarPreload = preload("res://Battlefield/Toolbar/toolbar.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var toolbar = toolbarPreload.instantiate();
	toolbar.health = health;
	toolbar.playerUnitTypes = playerUnitTypes;
	toolbar.build();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
