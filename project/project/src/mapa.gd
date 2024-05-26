extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_3_pressed():
	chanceBg("ocean2")
	

func _on_button_2_pressed():
	chanceBg("ocean1")

func chanceBg(option):
	var main=get_parent().get_parent()
	#
	var oldBg = main.get_node("Background")
	if oldBg:
		oldBg.queue_free()

	var newBg = load("res://src/"+option+".tscn")
	oldBg=newBg
	var instance = newBg.instantiate()
	instance.name="Background"
	main.add_child(instance)
	


func _on_button_4_pressed():
	chanceBg('ocean3') # Replace with function body.


func _on_button_5_pressed():
	chanceBg('ocean4')
