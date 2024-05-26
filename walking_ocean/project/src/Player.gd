extends CharacterBody2D

@export var speed = 600 
var screen_size 
var lts_direction="left"
@export var jump_velocity=-600.0
var gravity=ProjectSettings.get_setting("physics/2d/default_gravity")
# Called when the node enters the scene tree for the first time.

func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$AnimatedSprite2D.play()
	if not is_on_floor():
		velocity.y+=gravity*delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y=jump_velocity
		$AnimatedSprite2D.animation="jump-"+lts_direction
	
	var direction = Input.get_axis("move-left","move-right")
	
	if direction:
		velocity.x=direction*speed
		if direction<0:
			lts_direction="left"
		else:
			lts_direction="right"
		$AnimatedSprite2D.animation="walk-"+lts_direction
	else:
		velocity.x=move_toward(velocity.x,0,speed)
		$AnimatedSprite2D.animation="idle-"+lts_direction
	
	move_and_slide()
