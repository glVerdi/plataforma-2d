extends CharacterBody2D

enum PlayerEstate {
	idle,
	walk, 
	jump
}

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 80.0
const JUMP_VELOCITY = -300.0

var status: PlayerEstate

func _ready() -> void:
	go_to_idle_state()

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	match status:
		PlayerEstate.idle:
			idle_state()
		PlayerEstate.walk:
			walk_state()
		PlayerEstate.jump:
			jump_state()
			
	move_and_slide()

func go_to_idle_state():
	status = PlayerEstate.idle
	anim.play("idle")

func go_to_walk_state():
	status = PlayerEstate.walk
	anim.play("walk")
	
func go_to_jump_state():
	status = PlayerEstate.jump
	anim.play("jump")
	velocity.y = JUMP_VELOCITY

func idle_state():
	move()
	if velocity.x != 0:
		go_to_walk_state()
		return
		
	if Input.is_action_just_pressed("jump"):
		go_to_jump_state()
		return
	
func walk_state():
	move()
	if velocity.x == 0:
		go_to_idle_state()
		return
		
	if Input.is_action_just_pressed("jump"):
		go_to_jump_state()
		return
	
func jump_state():
	move()
	if is_on_floor():
		if velocity.x == 0:
			go_to_idle_state()
		else:
			go_to_walk_state()
		return
	
func move():
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction < 0:
		anim.flip_h = true
	elif direction > 0:
		anim.flip_h = false

func temp(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
