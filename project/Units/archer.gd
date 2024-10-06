extends Unit

var size = 1000;
@onready var plArrow = preload("res://Units/Projectile/Arrow.tscn");
@onready var firingRangeCollision = $FiringRange/FiringRangeCollision;

## Called when the node enters the scene tree for the first time.

func with(_isPlayer):
	return _with(_isPlayer, CONSTANTS.ARCHER_LIFE);

func _ready() -> void:
	super();
	var newCollisionShape = RectangleShape2D.new();
	newCollisionShape.size = Vector2(CONSTANTS.ARCHER_RANGE, 1);
	firingRangeCollision.shape = newCollisionShape;
#
func attack() -> void:
	var engagedHostileSize = engagedHostiles.size();
	if (engagedHostileSize > 0):
		create_arrow();

func create_arrow() -> void:
	var arrow = plArrow.instantiate().with(isPlayer);
	self.add_child(arrow);

func _on_area_entered(area: Area2D) -> void:
	super(area);

func _on_area_exited(area: Area2D) -> void:
	super(area);
	
func _on_firing_range_area_entered(area: Area2D) -> void:
	self._on_area_entered(area);

func _on_firing_range_area_exited(area: Area2D) -> void:
	_on_area_exited(area);
