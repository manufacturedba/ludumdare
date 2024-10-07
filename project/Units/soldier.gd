extends Unit

@onready var soldierSprite = $UnitSpriteMask/SoldierSprite;

func with(_isPlayer):
	defaultSpeed = CONSTANTS.SOLDIER_SPEED;
	return _with(_isPlayer, CONSTANTS.SOLDIER_LIFE, CONSTANTS.SOLDIER_DAMAGE, CONSTANTS.SOLDIER_SPEED);


func _ready() -> void:
	super();
	sprite.sprite_frames = soldierSprite.sprite_frames;
	sprite.play();
