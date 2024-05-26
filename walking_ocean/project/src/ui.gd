extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_map_pressed():
	var mapa = get_node("Panel")
	if !mapa:
		var scene_path = "res://src/mapa.tscn"
		var packed_scene = load(scene_path)
	
		if packed_scene:
			var instance = packed_scene.instantiate()
			
			add_child(instance)
	else:
		remove_child(mapa)
	
