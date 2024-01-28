extends Node2D

var npc = load("res://lvl/child.tscn")
@onready var time_lable = $Control/Time
@export var children_pos = [Vector2(0,0), Vector2(-800,800), Vector2(-800,-800),Vector2(800,800), Vector2(800,-800)]

# Called when the node enters the scene tree for the first time.
func _ready():
	var id = 0
	for p in children_pos :
		var npc_i = npc.instantiate()
		npc_i.position = p
		npc_i.ID = id
		id += 1
		npc_i.get_node("Sprite2D").visible = true
		$children.add_child(npc_i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#time_lable.set_text(time_to_str(($GlobalTimer.time_left)))
	pass

func _on_global_timer_timeout():
	get_tree().change_scene_to_file("res://menu/menu.tscn")

func _on_player_collided_child(child):
	child.queue_free()


func _on_spawn_timer_timeout():
	if $Player.IS_PLAYING:
		return
	if len($children.get_children()) < len(children_pos):
		var taken_pos = []
		for c in $children.get_children():
			taken_pos.append(c.ID)	
		var i = randi_range(0,len(children_pos)-1)
		while i in taken_pos:
			i = randi_range(0,len(children_pos)-1)
		var npc_i = npc.instantiate()
		npc_i.global_position = children_pos[i]
		npc_i.get_node("Sprite2D").visible=true
		$children.add_child(npc_i)
