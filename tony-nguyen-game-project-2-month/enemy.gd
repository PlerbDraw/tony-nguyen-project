extends CharacterBody2D


var speed = 50
var player_chase = false 
var player = null

func _physics_process(delta): 
	if player_chase: 
		position += (player.position - position)/speed
		
		


func _process(delta): 
	global_position.y += speed * delta 




func _on_visible_on_screen_notifier_2d_screen_exited():
	print("dead")
	queue_free()


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true 




func _on_detection_area_body_exited(body): 
	player = null 
	player_chase = false
