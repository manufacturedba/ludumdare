extends Archer

@onready var plCatapultBallistic = preload("res://Units/Projectile/CatapultBallistic.tscn");

func with(_isPlayer):
	defaultSpeed = CONSTANTS.CATAPULT_SPEED;
	return _with(_isPlayer, CONSTANTS.CATAPULT_LIFE);
	
func _ready() -> void:
	super();
	attackInterval = CONSTANTS.CATAPULT_FIRING_SPEED;
	projectile = plCatapultBallistic;
	range = CONSTANTS.CATAPULT_RANGE;
	var newCollisionShape = RectangleShape2D.new();
	newCollisionShape.size = Vector2(range, 1);
	firingRangeCollision.shape = newCollisionShape;
	firingRangeCollision.position.x = range;
	firingRange.position = Vector2(firingRange.position.x + CONSTANTS.CATAPULT_MINIMUM_RANGE, firingRange.position.y);

# engage hostiles in the firing zone after figuring out who is closest
func attack() -> void:
	var engagedHostileSize = engagedHostiles.size();
	if (engagedHostileSize > 0):
		var nearestHostile;
		var smallest;
		for hostile in engagedHostiles:
			var difference = abs(global_position.x - hostile.global_position.x);
			if !smallest or difference > smallest:
				nearestHostile = hostile;
				smallest = difference;
		var ballistic = projectile.instantiate().with(isPlayer);
		# Predetermined landing zone
		ballistic.destination = nearestHostile.global_position.x;
		ballistic.global_position.x = global_position.x;
		ballistic.global_position.y = global_position.y;
		# Ballistic will not die with catapult
		root_node.add_child(ballistic);
		
func _on_firing_range_area_entered(area: Area2D) -> void:
	_on_area_entered(area);

func _on_firing_range_area_exited(area: Area2D) -> void:
	_on_area_exited(area);
