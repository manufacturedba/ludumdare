extends Area2D

const MAX_LIFE = 20;
var life := MAX_LIFE

func damage(hp: int):
	life -= hp;
	if (life <= 0):
		print_debug("Enemy base destroyed");
		queue_free();
