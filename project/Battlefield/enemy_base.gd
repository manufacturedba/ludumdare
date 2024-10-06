extends Area2D

@onready var destructionTimer = $"../EnemyBaseDestructionTimer";

const MAX_LIFE = 20;
var life := MAX_LIFE

func damage(hp: int):
	life -= hp;
	if (life <= 0):
		destructionTimer.start(1);
		queue_free();
