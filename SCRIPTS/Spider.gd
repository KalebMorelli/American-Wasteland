extends CharacterBody2D

  
const SPEED = 2100.0
const JUMP_VELOCITY = -400.0
var direction := 1 

@onready var mannequin = $"../../../Mannequin"
@onready var SpiderRayCast2D := $SpiderRayCast2D as RayCast2D
@onready var SpiderRayCast2D_2 := $SpiderRayCast2D_2 as RayCast2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if SpiderRayCast2D.is_colliding():
		direction *= -1
		$SpiderAnimated.flip_h = false
	if SpiderRayCast2D_2.is_colliding():
		direction *= -1
		$SpiderAnimated.flip_h = true


	velocity.x = direction * SPEED * delta

	move_and_slide()


func _on_spider_area_2d_body_entered(body):

	if body.name == "Mannequin":
		print("teste")
		mannequin._Damage()

