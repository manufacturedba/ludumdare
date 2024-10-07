extends Area2D

@onready var toolbar = $"../Toolbar";
@onready var destructionTimer = $"../PlayerBaseDestructionTimer";
@onready var sprite = $PlayerBaseSprite;

const MAX_LIFE = 20;
const TWENTY_PERCENT_LIFE = MAX_LIFE * .2;
var life := MAX_LIFE;

func _ready():
	sprite.frame = 0

func damage(hp: int):
	if (life <= 0):
		return;
	life -= hp;
	var lifePercent = life * 100 / MAX_LIFE;
	toolbar.updateLifePercent(lifePercent);
	if (life <= 0):
		sprite.frame = 5;
		if (destructionTimer.is_stopped()):
			destructionTimer.start(1);
		return;
	if (life < TWENTY_PERCENT_LIFE):
		sprite.frame = 4;
	elif (life < 2*TWENTY_PERCENT_LIFE):
		sprite.frame = 3;
	elif (life < 3*TWENTY_PERCENT_LIFE):
		sprite.frame = 2;
	elif (life < 4*TWENTY_PERCENT_LIFE):
		sprite.frame = 1;
