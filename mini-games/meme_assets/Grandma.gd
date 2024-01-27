class_name Grandma extends Area2D

@export var IS_GRANDMA: bool = false
var text = null

func _init(grandma: bool):
	var sprite = Sprite2D.new()
	IS_GRANDMA = grandma
	if IS_GRANDMA:
		text = load("res://icon2.svg")
	else:
		text = load("res://icon.svg")
	sprite.texture = text
	add_child(sprite)
	var collision = CollisionShape2D.new()
	var rect = RectangleShape2D.new()
	rect.size = Vector2(30, 140)
	collision.shape = rect
	collision.position = Vector2(-50, 0)
	add_child(collision)
