extends Unit

class_name Archer

var size = 1000;
var range = 0;

@onready var plArrow = preload("res://Units/Projectile/Arrow.tscn");
@onready var firingRangeCollision = $FiringRange/FiringRangeCollision;
@onready var firingRange = $FiringRange;

@onready var archerSprite = $ArcherSprite;

var projectile;
@onready var parentNode = get_parent();

var rangedHostiles: Array[Area2D] = [];

func _process(delta: float) -> void:
	super(delta);
	
	if (timer.is_stopped() && rangedHostiles.size() > 0):
		attack();
		timer.start(attackInterval);
		
	
func with(_isPlayer):
	defaultSpeed = CONSTANTS.ARCHER_SPEED;
	return _with(_isPlayer, CONSTANTS.ARCHER_LIFE, CONSTANTS.ARCHER_DAMAGE, CONSTANTS.ARCHER_SPEED);

func update_sprite() -> void:
	sprite.sprite_frames = archerSprite.sprite_frames;
	sprite.play();
	
func _ready() -> void:	
	super();
	attackInterval = CONSTANTS.ARCHER_FIRING_SPEED;
	projectile = plArrow;
	var range = CONSTANTS.ARCHER_RANGE;
	var newCollisionShape = RectangleShape2D.new();
	newCollisionShape.size = Vector2(range, 1);
	firingRangeCollision.shape = newCollisionShape;
	firingRangeCollision.position.x = range;
	update_sprite();
	
func get_nearest_hostile() -> Area2D:
	var nearestHostile;
	var smallest;
	for hostile in rangedHostiles:
		var difference = abs(global_position.x - hostile.global_position.x);
		if !smallest or difference > smallest:
			nearestHostile = hostile;
			smallest = difference;
				
	return nearestHostile;

func attack() -> void:
	super();
	var engagedHostileSize = engagedHostiles.size();
	var rangedHostileSize = rangedHostiles.size();
	
	# If in melee range, halt arrow creation
	if (engagedHostileSize == 0 && rangedHostileSize > 0):
		create_arrow();

func create_arrow() -> void:
	var arrow = projectile.instantiate().with(isPlayer);
	arrow.global_position.x = global_position.x;
	arrow.global_position.y = global_position.y;
	arrow.destination = get_nearest_hostile().global_position.x;
	# Ballistic will not die with catapult
	parentNode.add_child(arrow);

func _on_area_entered(area: Area2D) -> void:
	if (!__checkHostile(area)):
		return;
		
	engagedHostiles.append(area);
	halt();

func _on_area_exited(area: Area2D) -> void:
	engagedHostiles.erase(area)
	
	# Delay movement until ranged enemies are also defeated
	if (rangedHostiles.size() == 0 && engagedHostiles.size() == 0):
		move();
	
func _on_firing_range_area_entered(area: Area2D) -> void:
	if (!__checkHostile(area)):
		return;
		
	rangedHostiles.append(area);
	halt();

func _on_firing_range_area_exited(area: Area2D) -> void:
	rangedHostiles.erase(area)
	
	# Continue engaging melee enemies after ranged enemies die
	if (engagedHostiles.size() == 0 && rangedHostiles.size() == 0):
		move();
