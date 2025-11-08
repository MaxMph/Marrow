extends Node3D

@export var item: PackedScene
@export var offset = 0.5
@export var branch_num_range = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	for i in randf_range(1, branch_num_range):
		var new_item = item.instantiate()
		new_item.position = global_position + Vector3(randf_range(-offset, offset), randf_range(0, offset) * 0.5, randf_range(-offset, offset))
		get_tree().root.add_child(new_item)
	queue_free()
	
