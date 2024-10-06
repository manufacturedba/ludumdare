extends Unit

class_name Archer

var size = 1000;
var range = 0;

@onready var plArrow = preload("res://Units/Projectile/Arrow.tscn");
@onready var firingRangeCollision = $FiringRange/FiringRangeCollision;
@onready var firingRange = $FiringRange;

var projectile;
@onready var root_node = get_node("/root");

func with(_isPlayer):
	defaultSpeed = CONSTANTS.ARCHER_SPEED;
	return _with(_isPlayer, CONSTANTS.ARCHER_LIFE);

func _ready() -> void:
	super();
	attackInterval = CONSTANTS.ARCHER_FIRING_SPEED;
	projectile = plArrow;
	var range = CONSTANTS.ARCHER_RANGE;
	var newCollisionShape = RectangleShape2D.new();
	newCollisionShape.size = Vector2(range, 1);
	firingRangeCollision.shape = newCollisionShape;
	firingRangeCollision.position.x = range;

func get_nearest_hostile() -> Area2D:
	var nearestHostile;
	var smallest;
	for hostile in engagedHostiles:
		var difference = abs(global_position.x - hostile.global_position.x);
		if !smallest or difference > smallest:
			nearestHostile = hostile;
			smallest = difference;
				
	return nearestHostile;

func attack() -> void:
	var engagedHostileSize = engagedHostiles.size();
	if (engagedHostileSize > 0):
		create_arrow();

func create_arrow() -> void:
	var arrow = projectile.instantiate().with(isPlayer);
	arrow.global_position.x = global_position.x;
	arrow.global_position.y = global_position.y;
	arrow.destination = get_nearest_hostile().global_position.x;
	# Ballistic will not die with catapult
	root_node.add_child(arrow);

func _on_area_entered(area: Area2D) -> void:
	super(area);

func _on_area_exited(area: Area2D) -> void:
	super(area);
	
func _on_firing_range_area_entered(area: Area2D) -> void:
	_on_area_entered(area);

func _on_firing_range_area_exited(area: Area2D) -> void:
	_on_area_exited(area);
