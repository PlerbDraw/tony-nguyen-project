class_name Enemy
extends CharacterBody2D

var player: Node
var speed: float =  20
var dead: bool = false
var health: int = 3
@export var health_ui = Node



var player_chase = false 


func _process(_delta: float) -> void:
	if not player == null:
		look_at(player.global_position)
	
	velocity = Vector2(1, 0).rotated(rotation) * speed 
	
	move_and_slide()



func _physics_process(_delta): 
	if player_chase: 
		position += (player.position - position)/speed
		
		






func _on_visible_on_screen_notifier_2d_screen_exited():
	print("dead")
	queue_free()


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true 

func hit(): 
	health -= 1 
	health_ui.value = health 
	health_ui.show()
	if health <= 0:
		dead = true
		queue_free()
	return dead




func _on_detection_area_body_exited(_body): 
	player = null 
	player_chase = false
