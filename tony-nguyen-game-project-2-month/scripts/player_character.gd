extends CharacterBody2D

@export var projectile_scene: PackedScene

const SPEED = 200.0
var can_shoot: bool = true 
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
	
	if Input.is_action_pressed("ui_shoot") and can_shoot:
		var projectile = projectile_scene.instantiate()
		projectile.rotation = $Sprite2D/Node2D.rotation
		projectile.global_position = self.global_position
		projectile.player = self
		add_sibling(projectile)
		
		#this first allows the player to shoot first
		

func _physics_process(delta):
	look_at(get_global_mouse_position())
	#makes the character look at mouse
