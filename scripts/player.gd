extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@onready var anim = $AnimatedSprite2D

const speed = 250.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("go_up"):
		self.translate(Vector2.UP * speed * delta)
		anim.play("go_up")
	elif Input.is_action_pressed("go_down"):
		self.translate(Vector2.DOWN * speed * delta)
		anim.play("go_down")
	elif Input.is_action_pressed("go_left"):
		self.translate(Vector2.LEFT * speed * delta)
		anim.play("go_left")
	elif Input.is_action_pressed("go_right"):
		self.translate(Vector2.RIGHT * speed * delta)
		anim.play("go_right")
	else:
		anim.stop()