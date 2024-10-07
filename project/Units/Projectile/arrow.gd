extends Node2D

class_name Arrow

var speed = CONSTANTS.ARROW_SPEED;
var damage = CONSTANTS.ARROW_DAMAGE;

var isPlayer : bool;
var direction = 1;
var normalSpeed = Vector2(0, 0);
var destination: int;

@onready var arrowCollisionAnimatedSprite2D = $ArrowCollision/ArrowAnimatedSprite2D;
@onready var arrowCollisionAnimatedSprite2DDeath = $ArrowCollision/ArrowAnimatedSprite2DDeath;
@onready var arrowCollisionAnimatedSprite2DBirth = $ArrowCollision/ArrowAnimatedSprite2DBirth;

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
	# Fly somewhere along the archer
	var positionNoise = randi_range(-50,50);
	position.y = position.y + positionNoise;
	add_to_group("ProjectileGroup");
	
	if (isPlayer):
		add_to_group("PlayerGroup");
	else:
		rotation = deg_to_rad(180);
		direction = -1;
		add_to_group("CpuGroup");

func _physics_process(delta: float) -> void:
	position += Vector2(direction * speed, 0) * delta
	
	# Arrow will not live past where it was aimed at
	# TODO: Handle both player and enemy directions
	var difference = abs(global_position.x - destination);
	if (difference <= 2):
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if (!__checkHostile(area)):
		return;
	
	if (area.damage):
		area.damage(damage);
	queue_free();

# Arrows vanishing
func _on_arrow_death_area_2d_area_entered(area: Area2D) -> void:
	if (!__checkHostile(area)):
		return;
		
	arrowCollisionAnimatedSprite2DDeath.visible = true;
	arrowCollisionAnimatedSprite2D.visible = false;
	arrowCollisionAnimatedSprite2DDeath.play();

# Arrows spawning
func _on_arrow_animated_sprite_2d_birth_animation_finished() -> void:
	arrowCollisionAnimatedSprite2D.visible = true;
	arrowCollisionAnimatedSprite2DBirth.visible = false;
	arrowCollisionAnimatedSprite2D.play();
