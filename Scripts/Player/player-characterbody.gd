extends CharacterBody2D

@onready var state_label: Label = $StateLabel

# Determines how fast the Player will move
var speed : float = 350
@export var gravity : float = 980.0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	state_label.text = str(velocity)
	pass

# Allows the Player to interact with physics
func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta
	
	# Stores current direction
	var direction : Vector2 = Vector2.ZERO
	
	# Reads input
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	
	velocity.x = direction.normalized().x * speed
	move_and_slide()
