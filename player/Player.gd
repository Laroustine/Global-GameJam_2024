extends CharacterBody2D

@export var speed:int = 400
@export var map_size:Vector2 = Vector2(2048,2048)
@onready var time_lable = $Control/Time
@export var timer:Timer 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_lable.set_text(time_to_str(int(timer.time_left)))

func time_to_str(time):
	var min = int(time)/60
	var sec = int(time) - min*60
	return str("%0*d"%[2,min])+":"+str("%0*d" % [2,sec])
	
func _physics_process(delta):
	# returns the direction with analog support
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	
	move_and_slide()
