extends Area2D

@export var IS_PLAYING = false
@export var SPEED = 400.0
@export var START = Vector2(420, 20)
@export var END = Vector2(420, 600)
@export var MOVE = 250.0
var TARGET
var IS_CLICKED = false

signal did_win(win: bool)

func _ready():
	position = START
	TARGET = END

func _process(delta):
	if IS_PLAYING and Input.is_action_pressed("ui_accept") and not IS_CLICKED:
		IS_CLICKED = true
		TARGET = Vector2(global_position.x + MOVE, global_position.y)

func _physics_process(delta):
	if global_position == TARGET and not IS_CLICKED:
		if TARGET == END:
			TARGET = START
		else:
			TARGET = END
	global_position = global_position.move_toward(TARGET, delta * SPEED)

func _on_area_entered(area):
	var grandma := area as Grandma
	did_win.emit(grandma.IS_GRANDMA)
