extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var speed = 60
var direction = 1

func _ready() -> void:
	z_index = 1
	add_to_group("Enemies")

func _process(delta: float) -> void:
	position.x += speed * delta * direction

func set_direction(skeleton_direction):
	direction = skeleton_direction
	anim.flip_h = direction < 0
	
func _on_self_destruct_timer_timeout() -> void:
	queue_free()
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox" or area.is_in_group("PlayerHitbox"): 
		call_deferred("queue_free")
	else:
		queue_free()
	
func _on_body_entered(_body: Node2D) -> void:
	# Se bater em paredes/chão do cenário, apenas some
	queue_free()
