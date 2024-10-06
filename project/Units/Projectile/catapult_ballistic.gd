extends Arrow
	
var engagedHostiles: Array[Area2D] = [];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super();
	speed = CONSTANTS.BALLISTIC_SPEED;
	damage = CONSTANTS.BALLISTIC_DAMAGE;

func with(_isPlayer: bool):
	isPlayer = _isPlayer;
	return self;

func _on_area_entered(area: Area2D) -> void:
	if (!__checkHostile(area)):
		return;
		
	engagedHostiles.append(area);

func _on_area_exited(area: Area2D) -> void:
	engagedHostiles.erase(area)

func explode() -> void:
	for hostile in engagedHostiles:
		# could be dead already
		if (hostile != null):
			hostile.damage(damage);
	queue_free();
	
func _physics_process(delta: float) -> void:
	position += Vector2(direction * speed, 0) * delta
	
	# TODO: Make sure this handles ballistics in both directions
	if (global_position.x >= destination):
		explode();
