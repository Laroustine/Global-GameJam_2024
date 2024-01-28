class_name Grandma extends Area2D

@export var IS_GRANDMA: bool = false
@export var anim: AnimationPlayer
var text_gran = preload("res://texture/old_lady.png")
var text_child = preload("res://texture/sad_kid.png")

func _ready():
	if IS_GRANDMA:
		$Sprite2D.texture = text_gran
	else:
		$Sprite2D.texture = text_child

