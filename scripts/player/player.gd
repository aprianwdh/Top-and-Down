extends CharacterBody2D

const SPEED = 5000
@onready var animation_tree = $AnimationTree
var atacking = false

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		animation_tree.get('parameters/playback').travel('atack')
		atacking = true
		
	if atacking == false:
		var input_vector = Vector2(Input.get_axis('ui_left','ui_right'),Input.get_axis('ui_up','ui_down')).normalized()
		
		self.velocity = input_vector*delta*SPEED
		
		if input_vector == Vector2.ZERO:
			animation_tree.get('parameters/playback').travel('iddle')
		else :
			animation_tree.get('parameters/playback').travel('walk')
			animation_tree.set('parameters/atack/BlendSpace2D/blend_position',input_vector)
			animation_tree.set('parameters/iddle/BlendSpace2D/blend_position',input_vector)
			animation_tree.set('parameters/walk/BlendSpace2D/blend_position',input_vector)
		move_and_slide()


func _on_animation_tree_animation_finished(anim_name):
	print('animated finish' + anim_name)
	if 'atack_up' in anim_name:
		atacking = false
	if 'atack_down' in anim_name:
		atacking = false
	if 'atack_left' in anim_name:
		atacking = false
	if 'atack_right' in anim_name:
		atacking = false


