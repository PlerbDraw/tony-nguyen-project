extends Area2D


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




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	
	#move_local_x(SPEED)

#func _on_enemy_hit(body: Node2D) -> void:
	#if not player == body:
		#player.increase_score(body.hit())
		#queue_free
		
		#body.hit()
		#print(body.hit())
		#player.increase_score()
		#queue_free()
	#print("HIT!")
