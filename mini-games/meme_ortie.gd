extends Node2D

@export_range(1, 4) var NUM_GRANDMA = 3
@export var IS_PLAYING = false

signal give_score(score: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("shake")
	randomize()
	var height = 648 / (NUM_GRANDMA + 1)
	var rnd_gr = randi_range(0, NUM_GRANDMA - 1)
	var grand_snc = load("res://mini-games/meme_assets/Grandma.tscn")
	for i in range(NUM_GRANDMA):
		var grand = grand_snc.instantiate()
		grand.IS_GRANDMA = i == rnd_gr
		grand.position = Vector2(700, height + height * i)
		$Characters.add_child(grand)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Hand.IS_PLAYING = IS_PLAYING

func _on_hand_did_win(win):
	if win:
		give_score.emit(100)
	else:
		give_score.emit(-50)
