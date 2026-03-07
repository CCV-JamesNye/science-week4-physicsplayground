extends CharacterBody2D

@onready var state_label: Label = $StateLabel

# Determines how fast the Player will move
var speed : float = 350
@export var gravity : float = 980.0
@export var jump_force : float = -500
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
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
	if direction != Vector2.ZERO:
		animated_sprite_2d.play("walk")
		if direction.x <0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.play("idle")
	
	velocity.x = direction.normalized().x * speed
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_force

func die () -> void:
	print("GAME OVER")
	get_tree().call_deferred('reload_current_scene')
