extends Node3D

var day_length = 12 * 60
var day_time
var day_dir = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day_time = day_length / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#day/night cycle
	#if day_time > 0 and day_time < day_length:
		#day_time += 1 * delta
	#else:
	
	#if day_time > 0 and day_time < day_length:
		#day_time += day_dir * delta
		#
	day_time += day_dir * delta
	if day_time < 0:
		day_time = 0
		day_dir = 1
	if day_time > day_length:
		day_dir = -1
	$DirectionalLight3D.light_energy = day_time / day_length
