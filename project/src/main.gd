extends Node

# Export variables to easily adjust in the editor
@export var floor_segment_scene : PackedScene
@export var num_segments : int = 5
@export var segment_width : int = 200

var segments : Array
var character : Node2D

func _ready():
	character = $Player 
	segments = []
	
	# Instanciar segmentos iniciales
	for i in range(num_segments):
		var segment = floor_segment_scene.instantiate()
		segment.position = Vector2(i * segment_width, 0)
		add_child(segment)
		segments.append(segment)

func _process(delta):
	# Verificar si el personaje ha avanzado y necesitamos reciclar segmentos
	for segment in segments:
		if segment.global_position.x + segment_width < character.global_position.x - segment_width:
			segment.position.x += num_segments * segment_width
