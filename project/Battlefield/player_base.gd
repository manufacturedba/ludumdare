extends Area2D

@onready var toolbar = $"../Toolbar";
@onready var destructionTimer = $"../PlayerBaseDestructionTimer"

const MAX_LIFE = 20;
var life := MAX_LIFE;

func damage(hp: int):
	life -= hp;
	var lifePercent = life * 100 / MAX_LIFE;
	toolbar.updateLifePercent(lifePercent);
	if (life <= 0):
		destructionTimer.start(1);
		queue_free();
