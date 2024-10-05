extends Area2D

var life := 20

func damage(hp: int):
	life -= hp;
	if (life <= 0):
		print_debug("Enemy base destroyed");
		queue_free();
