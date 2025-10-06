extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

@export var projectile_scene: PackedScene
const SPEED: float = 300.0
@export var bullet_scene: PackedScene
@export var bullet_spawn: Node
@export var ui: Node 
@export var spark_scene: PackedScene
@export var health_ui: Node # Replace with function body.
var can_shoot: bool = true 
var health: int = 5


#The movement speed of the character, could be changed later.
#const means that it won't change while the game is running. 
#it could be used liater for things like upgrades or speedbossts
func _process(_delta: float) -> void:
	
	var v_direction: float = Input.get_axis("ui_up" , "ui_down")
	if v_direction: 
		animated_sprite.play("moving")
		#animation for walking
		
	else: 
		animated_sprite.play("idle")
		
		
	var h_direction: float = Input.get_axis("ui_left" , "ui_right")
	var direction: Vector2 = Vector2(h_direction, v_direction)
	velocity = Vector2(SPEED * h_direction, SPEED * v_direction)
	velocity = direction * SPEED
	move_and_slide()
	#This whole line allows player to move dynamically diagonal. 
	
	if Input.is_action_pressed("ui_shoot") and can_shoot:
		var projectile = projectile_scene.instantiate()
		projectile.rotation = $Sprite2D/Node2D.rotation
		projectile.global_position = self.global_position
		projectile.player = self
		add_sibling(projectile)
		#this first allows the player to shoot first and when the player shoots
		#blue projectile asset comes out. 



func _bullet_cooldown() -> void:
	can_shoot = true



func _receive_damage(body: Node2D) -> void:
	if body is Enemy:
		health -= 1
		print("Health: ", health)
	if health <= 0: 
		print("game over")
		self.queue_free()
		get_node("../Gameover").game_over()
			#get_tree().reload_current_scene()
#this code helps godot to apply if enemy touches player, player takes damage.
#when player takes damage, the game quits and player has to start over.
