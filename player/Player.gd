extends CharacterBody2D

@export var speed:int = 400
@export var map_size:Vector2 = Vector2(2048,2048)
@onready var time_lable = $Control/Time
@onready var score_lable = $Control/Score
@onready var minigame_window = $Control/SubViewportContainer/SubViewport
@export var timer:Timer 
var SCORE = 0

var IS_PLAYING = false
var MINI_GAMES = [
	preload("res://mini-games/tarte-face.tscn"),
	preload("res://mini-games/meme_ortie.tscn"),
]
var CURRENT_GAME = null

signal collided_child(child)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	time_lable.set_text(time_to_str(int(timer.time_left)))
	score_lable.set_text("Score: " + str(SCORE))

func time_to_str(time: int):
	var minute = time / 60
	var sec = time - minute * 60
	return str("%0*d"%[2,minute])+":"+str("%0*d" % [2,sec])
	
func _physics_process(_delta):
	if IS_PLAYING:
		return
	# returns the direction with analog support
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if velocity.y >= 0:
			$AnimationPlayer.play("move")
		else:
			$AnimationPlayer.play("move_top")
	else:
		$AnimationPlayer.play("idle")
	move_and_slide()

func set_playing(value: bool):
	IS_PLAYING = value
	$Control/SubViewportContainer.visible = value
	if CURRENT_GAME:
		CURRENT_GAME.IS_PLAYING = value

func _on_area_2d_area_entered(area):
	CURRENT_GAME = MINI_GAMES[randi_range(0, len(MINI_GAMES) - 1)].instantiate()
	CURRENT_GAME.give_score.connect(_on_give_score)
	minigame_window.call_deferred("add_child", CURRENT_GAME)
	set_playing(true)
	collided_child.emit(area)

func _on_give_score(value):
	SCORE += value
	set_playing(false)
	if CURRENT_GAME:
		CURRENT_GAME.queue_free()
	CURRENT_GAME = null
