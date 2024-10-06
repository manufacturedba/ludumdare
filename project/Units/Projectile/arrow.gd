extends Node2D

var speed = CONSTANTS.ARROW_SPEED;
var isPlayer : bool;
var direction = 1;
var normalSpeed = Vector2(0, 0);

func with(_isPlayer: bool):
	isPlayer = _isPlayer;
	return self;

func __checkHostile(area: Area2D) -> bool:
	if (area.is_in_group("ProjectileGroup")):
		return false;
		
	var iAmPlayer = is_in_group("PlayerGroup");
	if (iAmPlayer):
		return area.is_in_group("CpuGroup");
	else:
		return area.is_in_group("PlayerGroup");
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("ProjectileGroup");
	
	if (isPlayer):
		add_to_group("PlayerGroup");
	else:
		add_to_group("CpuGroup");
	normalSpeed = Vector2(direction * speed, 0);

func _physics_process(delta: float) -> void:
	position += normalSpeed * delta

func _on_area_entered(area: Area2D) -> void:
	if (!__checkHostile(area)):
		return;
	
	if (area.damage):
		area.damage(1);
	queue_free();
