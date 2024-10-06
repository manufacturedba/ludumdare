extends Archer

@onready var plCatapultBallistic = preload("res://Units/Projectile/CatapultBallistic.tscn");

func with(_isPlayer):
	return _with(_isPlayer, CONSTANTS.CATAPULT_LIFE);
	
func _ready() -> void:
	super();
	projectile = plCatapultBallistic;
	range = CONSTANTS.CATAPULT_RANGE;
