extends CharacterBody2D


const SPEED = 200.0
#The movement speed of the character, could be changed later.
#const means that it won't change while the game is running. 
#it could be used liater for things like upgrades or speedbossts
func _process(_delta: float) -> void:
	var v_direction: float = Input.get_axis("ui_up" , "ui_down")
	var h_direction: float = Input.get_axis("ui_left" , "ui_right")
	
	var direction: Vector2 = Vector2(h_direction, v_direction)
	
	velocity = Vector2(SPEED * h_direction, SPEED * v_direction)
	
	velocity = direction * SPEED
	
	move_and_slide()
