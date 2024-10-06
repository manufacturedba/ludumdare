extends Arrow
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super();
	speed = CONSTANTS.BALLISTIC_SPEED;
	damage = CONSTANTS.BALLISTIC_DAMAGE;
