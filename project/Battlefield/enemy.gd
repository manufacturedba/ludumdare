extends Area2D

var speed := Vector2(-1, 0);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	position += speed * delta

# When base/enemies come into damage area
func _on_area_entered(area: Area2D) -> void:
	# if area.health: this.store(area)
	pass # Replace with function body.

# This will handle when enemies die
func _on_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
