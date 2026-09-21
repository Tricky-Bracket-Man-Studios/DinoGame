extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(3).timeout
	ManagerSignalBus.deliver_player_dino_HP.connect(change_text)
	
	ManagerSignalBus.get_player_dino_HP.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func change_text(hp: String) -> void:
	text = "HP: " + hp
	ManagerSignalBus.get_player_dino_HP.emit()
