extends Area2D

signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(Vector2(576,310))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	hit.emit()
