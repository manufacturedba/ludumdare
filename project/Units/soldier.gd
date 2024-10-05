extends Area2D;

@onready var sprite = $SoldierSprite;
@onready var spriteMask = $SoldierSpriteMask;
@onready var collision = $SoldierCollision;
@onready var timer = $SoldierAttackTimer;

const DEFAULT_SPEED := Vector2(50,0);
const ATTACK_SPEED = 1;
const DAMAGE = 1;
const MAX_LIFE = 5;

var life = MAX_LIFE;
var color: Color;
var normalSpeed: Vector2;
var currentSpeed: Vector2;
var isPlayer: bool
var engagedHostiles: Array[Area2D] = [];

func with(_isPlayer: bool):
	isPlayer = _isPlayer;
	return self;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (isPlayer):
		sprite.modulate = Color.BLUE;
		normalSpeed = DEFAULT_SPEED;
		add_to_group("PlayerGroup");
	else:
		sprite.modulate = Color.RED;
		normalSpeed = -1*DEFAULT_SPEED;
		add_to_group("CpuGroup");
	currentSpeed = normalSpeed;
	$SoldierSprite.frame = randi_range(0,3);
	$SoldierSprite.play();
	set_clip_children_mode(CanvasItem.CLIP_CHILDREN_ONLY);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (timer.is_stopped() && engagedHostiles.size() > 0):
		attack();
		timer.start(ATTACK_SPEED);
		
func attack() -> void:
	var engagedHostileSize = engagedHostiles.size();
	if (engagedHostileSize > 0):
		engagedHostiles[engagedHostileSize - 1].damage(DAMAGE)
		
func damage(hp: int):
	life -= hp;
	if (life <= 0):
		queue_free();
		
func __updateWidth() -> void:
	var editedRegionRect = sprite.region_rect();
	editedRegionRect.width = editedRegionRect.width * life / MAX_LIFE;
	spriteMask.set_region_rect(editedRegionRect);
	
	

func _physics_process(delta: float) -> void:
	position += currentSpeed * delta

func _on_area_entered(area: Area2D) -> void:
	if (!__checkHostile(area)):
		return;
		
	engagedHostiles.append(area);
	currentSpeed = Vector2(0, 0);
	
func __checkHostile(area: Area2D) -> bool:
	var iAmPlayer = is_in_group("PlayerGroup");
	if (iAmPlayer):
		return area.is_in_group("CpuGroup");
	else:
		return area.is_in_group("PlayerGroup");

func _on_area_exited(area: Area2D) -> void:
	engagedHostiles.erase(area)
	if (engagedHostiles.size() == 0):
		currentSpeed = normalSpeed
