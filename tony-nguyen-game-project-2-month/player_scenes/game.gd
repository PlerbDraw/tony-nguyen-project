extends Node2D

var enemy = preload("res://enemy.tscn")





var current_wave: int = 1
var enemies_remaining: int 
var enemies_spawned: int = 0 

var
var
var 
var enemy_spawn_time
var enemy_health
var enemy_speed



func _on_SpawnTimer_timeout():
	var enemy_instances = enemy.instantiate() 
	add_child(enemy_instances)
	enemy_instances.position = $SpawnLocation.position 
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position 
	$SpawnLocation.position = position
