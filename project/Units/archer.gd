extends Unit

class_name Archer

var size = 1000;
var range = 0;

@onready var plArrow = preload("res://Units/Projectile/Arrow.tscn");
@onready var firingRangeCollision = $FiringRange/FiringRangeCollision;

var projectile;

func with(_isPlayer):
	range = CONSTANTS.ARCHER_RANGE;
	return _with(_isPlayer, CONSTANTS.ARCHER_LIFE);

func _ready() -> void:
	super();
	projectile = plArrow;
	var newCollisionShape = RectangleShape2D.new();
	newCollisionShape.size = Vector2(range, 1);
	firingRangeCollision.shape = newCollisionShape;
#
func attack() -> void:
	var engagedHostileSize = engagedHostiles.size();
	if (engagedHostileSize > 0):
		create_arrow();

func create_arrow() -> void:
	var arrow = projectile.instantiate().with(isPlayer);
	self.add_child(arrow);

func _on_area_entered(area: Area2D) -> void:
	super(area);

func _on_area_exited(area: Area2D) -> void:
	super(area);
	
func _on_firing_range_area_entered(area: Area2D) -> void:
	self._on_area_entered(area);

func _on_firing_range_area_exited(area: Area2D) -> void:
	_on_area_exited(area);
