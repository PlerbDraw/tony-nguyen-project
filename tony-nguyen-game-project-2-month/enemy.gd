class_name Enemy
extends CharacterBody2D

signal enemy_died

var player: Node2D
var speed: float =  50
var dead: bool = false
var health: int = 3
@export var health_ui = Node
#variables of enemy


var player_chase = false 


func _process(_delta: float) -> void:
	if not player == null:
		look_at(player.global_position)
	velocity = Vector2(1, 0).rotated(rotation) * speed 
	move_and_slide()
#this code combines with the code below to stabilise the speed of enemy



func _physics_process(_delta): 
	if player_chase: 
		var dir = (player.position - position).normalized()
		velocity = dir * speed
		move_and_slide()
		#both code functions the same, makes enemy track move towards player 



func _on_detection_area_body_entered(body):
	player = body
	player_chase = true 
#If player is a body, then chase players. 



func hit(): 
	health -= 1 
	if health <= 0: 
		var wave_system = get_tree().get_first_node_in_group("wave_system")
		if wave_system:
			wave_system.update_enemy_ui()
		dead = true
		queue_free()
		return true
	return false
#this function makes enemy process taking damage. 
#When damage is taken and health equals 0, then wave system updates enemy ui
#then the enemy sprite disappears 
