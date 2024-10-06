extends Archer

@onready var plCatapultBallistic = preload("res://Units/Projectile/CatapultBallistic.tscn");

@onready var catapultSprite = $CatapultSprite;

func with(_isPlayer):
	defaultSpeed = CONSTANTS.CATAPULT_SPEED;
	return _with(_isPlayer, CONSTANTS.CATAPULT_LIFE, CONSTANTS.CATAPULT_DAMAGE, CONSTANTS.CATAPULT_SPEED);

func update_sprite() -> void:
	sprite.sprite_frames = catapultSprite.sprite_frames;
	sprite.play();
	
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
	super();

func create_arrow() -> void:
	var nearestHostile;
	var smallest;
	for hostile in rangedHostiles:
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
	parentNode.add_child(ballistic);
		
func _on_firing_range_area_entered(area: Area2D) -> void:
	super(area);

func _on_firing_range_area_exited(area: Area2D) -> void:
	super(area);
