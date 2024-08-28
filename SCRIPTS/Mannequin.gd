extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -245.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumping
var HP = 3
var TakingDamage
signal dead

	  #################### MOVIMENTO ################
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumping = true
	else:
		jumping = false
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction && !TakingDamage:
		velocity.x = direction * SPEED
		$MannequinAnimated.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if !TakingDamage:
		if is_on_floor():
			if jumping:
				$MannequinAnimated.play("MannequinJump")
			elif direction !=0:
				$MannequinAnimated.play("MannequinRun")
			elif direction ==0:
				$MannequinAnimated.play("MannequinIdle")
		else:
			if velocity.y<0:
				$MannequinAnimated.play("MannequinJump")
			else:
				$MannequinAnimated.play("MannequinFall")
	move_and_slide()
	#################################################

func _Damage():
	TakingDamage = true
	$MannequinAnimated.play("MannequinHit")
	await $MannequinAnimated.animation_finished
	TakingDamage = false
	print("teste2")
	emit_signal("dead")
