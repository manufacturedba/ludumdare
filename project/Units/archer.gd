extends Unit

var size = 1000;

@onready var plArrow = preload("res://Units/Projectile/Arrow.tscn");
@onready var firingRangeCollision = $FiringRangeCollision;

## Called when the node enters the scene tree for the first time.

func _ready() -> void:
	super();

#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
func attack() -> void:
	var engagedHostileSize = engagedHostiles.size();
	if (engagedHostileSize > 0):
		create_arrow();

func create_arrow() -> void:
	var arrow = plArrow.instantiate().with(isPlayer);
	self.add_child(arrow);
	
func __updateWidth() -> void:
	var totalWidth = sprite.sprite_frames.get_frame_texture('default', 0).get_width();
	var newWidth = totalWidth * life / MAX_LIFE;
	spriteMask.region_rect = Rect2(spriteMask.region_rect.position, Vector2(newWidth, spriteMask.region_rect.size.y));
	var newCollisionShape = RectangleShape2D.new();
	newCollisionShape.size = spriteMask.region_rect.size;
	collision.shape = newCollisionShape;

func _on_area_entered(area: Area2D) -> void:
	super(area);

func _on_area_exited(area: Area2D) -> void:
	super(area);
	
func _on_firing_range_area_entered(area: Area2D) -> void:
	self._on_area_entered(area);

func _on_firing_range_area_exited(area: Area2D) -> void:
	_on_area_exited(area);
