extends Area2D


func _on_body_entered(body):
	if body.name == "Mannequin":
		$NukeBarrelAnimated.play("NukeCollected")
		await $NukeBarrelAnimated.animation_finished
		queue_free()
		
		
	
