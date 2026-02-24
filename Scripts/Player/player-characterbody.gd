extends CharacterBody2D

# Determines how fast the Player will move
var speed : float = 350
@export var gravity : float = 980.0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Allows the Player to interact with physics
func _physics_process(delta: float) -> void:
	# Stores current direction
	var direction : Vector2 = Vector2.ZERO
	velocity.y += gravity * delta
	
	# Reads input
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	
	velocity = direction.normalized() * speed
	move_and_slide()
