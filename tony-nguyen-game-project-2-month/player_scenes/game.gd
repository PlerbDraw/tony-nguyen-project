extends Node2D

var enemy = preload("res://enemy.tscn")



func _on_SpawnTimer_timeout():
	var enemy_instances = enemy.instantiate() 
	add_child(enemy_instances)
	enemy_instances.position = $SpawnLocation.position 
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position 
	$SpawnLocation.position = position
