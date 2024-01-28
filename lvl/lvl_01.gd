extends Node2D

var npc = load("res://lvl/child.tscn")
@export var children_pos = [Vector2(0,-150), Vector2(-800,800), Vector2(-650,-650),Vector2(400,750), Vector2(550,-800)]

var SCORE = 0

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
func _process(_delta):
	#time_lable.set_text(time_to_str(($GlobalTimer.time_left)))
	pass

func _on_global_timer_timeout():
	if SCORE < 0:
		$WIN.stream = load("res://music/lose.ogg")
	elif SCORE <= 100:
		$WIN.stream = load("res://music/mid.ogg")
	else:
		$WIN.stream = load("res://music/win.ogg")
	$WIN.play()
	$Player.IS_PLAYING = true

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

func _on_player_new_score(score):
	SCORE = score


func _on_win_finished():
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://menu/menu.tscn")
