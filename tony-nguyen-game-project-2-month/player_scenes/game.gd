extends Node2D

var enemy = preload("res://enemy.tscn")

@export var enemy_scene: PackedScene
@export var enemy_spawn: Node
@export var wave_ui: Node
@export var spawn_timer: Node
@export var enemy_ui: Node
#this is to export different assets and nodes into the game
#allowing it to show different features like waves and health.


var current_wave: int = 1
var enemies_remaining: int 
var enemies_spawned: int = 0 

var new_enemy_count: int = 3 
var last_enemy_count: int = 2
var wave_enemy_count:int = new_enemy_count + last_enemy_count
var enemy_spawn_time: int = 4.0 
var enemy_health: int = 3
var enemy_speed: float = 200.0  


func _ready() -> void:
	wave_ui.text = "Wave: " + str(current_wave)
	enemy_ui.text = "Enemies Remaining: " + str(wave_enemy_count)
	enemies_remaining = wave_enemy_count
	last_enemy_count = new_enemy_count
	new_enemy_count = wave_enemy_count
	#this is codes for the wave system that exists in the game. 

func update_enemy_ui() -> void:
	enemies_remaining -= 1 
	enemy_ui.text = "Enemies Remaining: " + str(enemies_remaining)
	if enemies_remaining <= 0: 
		_new_wave()
#this is ui text to deliver information about the enemies remaining to player

func _new_wave() -> void:
	current_wave += 1
	if current_wave % 3 == 0: 
		enemy_health
		enemy_speed
	if enemy_spawn_time > 1: 
		enemy_spawn_time -= 0.3
	enemies_spawned = 0
	wave_enemy_count = last_enemy_count + new_enemy_count
	last_enemy_count = new_enemy_count
	new_enemy_count = wave_enemy_count
	enemies_remaining = wave_enemy_count
	wave_ui.text = "Wave: " + str(current_wave)
	enemy_ui.text = "Enemies Remaining: " + str(wave_enemy_count)
	spawn_timer.start()
	#this tells us that when the new wave starts, enemies stats are modified
	#enemies gets faster, stronger and spawn more frequently.






func _on_SpawnTimer_timeout():
	var enemy_instances = enemy.instantiate() 
	add_child(enemy_instances)
	enemy_instances.position = $SpawnLocation.position 
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position 
	$SpawnLocation.position = position
