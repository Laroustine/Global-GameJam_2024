extends CharacterBody2D

@export var speed:int = 400
@export var map_size:Vector2 = Vector2(2048,2048)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	# returns the direction with analog support
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	
	move_and_slide()
