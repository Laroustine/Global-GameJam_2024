extends Node2D

var pos_l = []
@export var n_pos: int = 10
@export var map_size: Vector2 = Vector2(1100, 600)
@export var IS_PLAYING = false
@export var SPEED = 400.0

var indx:int = 0
var face_target: Vector2
var HIT_SCORE: int = 0

signal give_score(score: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$AnimationPlayer.play("shake")
	var face = $Face
	var ret  = $Reticle
	#face.set_scale(Vector2(2,2))
	#ret.set_scale(Vector2(1,1))
	ret.global_position = Vector2(map_size.x/2, map_size.y/2)
	

	var pos = Vector2.ZERO
	for i in range(n_pos-1):
		pos.x = randi_range(0,map_size.x)
		pos.y = randi_range(0,map_size.y)
		pos_l.append(pos)
	pos_l.append(ret.position)
	face.global_position = Vector2(500, 310)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Reticle.IS_PLAYING = IS_PLAYING
	if HIT_SCORE == 0:
		$Face.position.x = move_toward($Face.position.x, face_target.x, SPEED * delta)
		$Face.position.y = move_toward($Face.position.y, face_target.y, SPEED * delta)
	if not $AnimationPlayer.is_playing():
		give_score.emit(HIT_SCORE)

func _on_timer_timeout():
	if randi_range(0,1) < 1:
		indx = randi_range(0,n_pos-1)
	face_target = pos_l[indx]
	#$Face.global_position = pos_l[indx]

func _on_reticle_hit(did_hit):
	$AnimationPlayer.play("throw")
	if did_hit:
		HIT_SCORE = 100
	else:
		HIT_SCORE = -50
