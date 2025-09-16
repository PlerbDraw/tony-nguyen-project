extends Area2D


const BULLET = preload("res://bullet.tscn")

@onready var muzzle: Marker2D = $Marker2D
@onready var sfxshoot = $"../sfx_shoot"


func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270: 
		scale.y = -1
	else:
		scale.y = 1
		
	if Input.is_action_just_pressed("fire"):
		var bullet_instance = BULLET.instantiate() 
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = muzzle.global_position
		bullet_instance.rotation = rotation
		sfxshoot.play()
