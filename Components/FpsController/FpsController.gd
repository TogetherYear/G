extends CharacterBody3D

@export var stopSpeed = 5.0

@export var airStopSpeed = 0.04

@export var speed = 5.0

@export var jumpVelocity = 2.4

@export var gravity = 9.8

@export var rotateSpeed = 0.06

func _process(_delta):
	OnMovement()

func OnMovement():
	OnGravity()
	OnJump()
	OnMove()
	move_and_slide()

func OnGravity():
	if !is_on_floor():
		velocity.y -= gravity * get_process_delta_time()

func OnJump():
	if TStatus.CanController():
		if Input.is_action_just_pressed("Jump") && is_on_floor():
			velocity.y = jumpVelocity

func OnMove():
	if TStatus.CanController():
		if !is_on_floor():
			velocity.x = move_toward(velocity.x, 0, airStopSpeed)
			velocity.z = move_toward(velocity.z, 0, airStopSpeed)
		else:
			var input_dir = Input.get_vector("Left", "Right", "Forward", "Backward")
			var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
			if direction:
				velocity.x = direction.x * speed
				velocity.z = direction.z * speed
			else:
				velocity.x = move_toward(velocity.x, 0, stopSpeed)
				velocity.z = move_toward(velocity.z, 0, stopSpeed)


func _input(event):
	if TStatus.CanController():
		if event is InputEventMouseMotion:
			rotate_y(deg_to_rad(-event.relative.x * rotateSpeed))
			$CameraArm.rotate_x(deg_to_rad(-event.relative.y * rotateSpeed))
			$CameraArm.rotation.x = clamp($CameraArm.rotation.x, deg_to_rad(-70.0), deg_to_rad(70.0))
