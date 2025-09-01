extends Node2D

const SPEED: int = 300 
var player: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	


func _on_enemy_hit(body: Node2D) -> void:
	if not player == body:
		player.increase_score(body.hit())
		queue_free
		
