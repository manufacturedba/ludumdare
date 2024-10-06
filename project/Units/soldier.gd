extends Unit

func with(_isPlayer):
	defaultSpeed = CONSTANTS.SOLDIER_SPEED;
	return _with(_isPlayer, CONSTANTS.SOLDIER_LIFE);

func _ready() -> void:
	super();
