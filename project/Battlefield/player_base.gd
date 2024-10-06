extends Area2D

@onready var toolbar = $"../Toolbar";
const MAX_LIFE = 20;
var life := MAX_LIFE;

func damage(hp: int):
	life -= hp;
	var lifePercent = life * 100 / MAX_LIFE;
	toolbar.updateLifePercent(lifePercent);
	if (life <= 0):
		print_debug("Player base destroyed");
		queue_free();
