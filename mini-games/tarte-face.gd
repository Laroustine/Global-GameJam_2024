extends Node2D

var pos_l = []
@export var n_pos:int = 10
var indx:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var map_size = get_viewport().content_scale_size

	var face = $Face
	var ret  = $Reticle
	#face.set_scale(Vector2(2,2))
	#ret.set_scale(Vector2(1,1))
	ret.set_position(Vector2(map_size.x/2, map_size.y/2))

	var pos = Vector2.ZERO
	for i in range(n_pos-1):
		pos.x = randi_range(0,map_size.x)
		pos.y = randi_range(0,map_size.y)
		pos_l.append(pos)
	pos_l.append(ret.position)
	face.set_position(Vector2(500, 310))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_reticle_hit():
	if Input.is_action_pressed("ui_accept"):
		get_tree().quit()


func _on_timer_timeout():
	if randi_range(0,1) < 1:
		indx = randi_range(0,n_pos-1)
	$Face.position = pos_l[indx]
