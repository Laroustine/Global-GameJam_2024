extends Area2D

@export var IS_PLAYING = false

signal hit(did_hit: bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(Vector2(576,310))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if IS_PLAYING and Input.is_action_pressed("ui_accept"):
		hit.emit(len(get_overlapping_areas()) > 0)
