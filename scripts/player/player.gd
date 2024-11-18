extends CharacterBody2D

const SPEED = 5000

func _physics_process(delta):
	var vector_x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	var vector_y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	
	self.velocity = Vector2(vector_x,vector_y)*delta*SPEED
	
	move_and_slide()
