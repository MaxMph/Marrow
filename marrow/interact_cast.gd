extends RayCast3D

var interactable = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	interactable = null
	if is_colliding() and get_collider() != null: #and get_collider().has_method("interact"):
		if get_collider().has_method("interact"):
			interactable = get_collider()
	
	if interactable != null:
		$int_marker.visible = true
	else:
		$int_marker.visible = false
