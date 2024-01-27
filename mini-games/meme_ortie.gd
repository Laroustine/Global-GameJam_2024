extends Node2D

@export_range(1, 4) var NUM_GRANDMA = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var height = get_viewport().content_scale_size.y / (NUM_GRANDMA + 1)
	var rnd_gr = randi_range(0, NUM_GRANDMA - 1)
	for i in range(NUM_GRANDMA):
		var grand = Grandma.new(i == rnd_gr)
		grand.position = Vector2(700, height + height * i)
		$Characters.add_child(grand)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
