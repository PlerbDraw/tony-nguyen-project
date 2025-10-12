extends HSlider

@export var audio_bus_name: String
var audio_bus_id


func _ready(): 
	var audio_bus_id = AudioServer.get_bus_index("Sfx")
	

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_id, value)
