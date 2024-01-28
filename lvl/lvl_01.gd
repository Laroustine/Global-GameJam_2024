extends Node2D

var npc = load("res://child.tscn")
@onready var time_lable = $Control/Time

# Called when the node enters the scene tree for the first time.
func _ready():
	var npc0 = npc.instantiate()
	$children.add_child(npc0)
	npc0.position = Vector2(0,0)

	var npc1 = npc.instantiate()
	$children.add_child(npc1)
	npc1.global_position = Vector2(-800,800)

	var npc2 = npc.instantiate()
	$children.add_child(npc2)
	npc2.position = Vector2(-800,-800)

	var npc3 = npc.instantiate()
	$children.add_child(npc3)
	npc3.position = Vector2(800,800)

	var npc4 = npc.instantiate()
	$children.add_child(npc4)
	npc4.position = Vector2(800,-800)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#time_lable.set_text(time_to_str(($GlobalTimer.time_left)))
	pass

func _on_global_timer_timeout():
	get_tree().change_scene_to_file("res://menu/menu.tscn")

func _on_player_collided_child(child):
	child.queue_free()
