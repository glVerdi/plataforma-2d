extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
var tempo: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	tempo += delta
	sprite.position.y = sin(tempo * 3.0) * 4.0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.is_in_group("player"):
		GameManeger.has_wall_jump = true
		queue_free()
