extends Node2D

@onready var frame: AnimatedSprite2D = $Frame

# Called when the node enters the scene tree for the first time.
func _ready():
	frame.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hitbox_mouse_entered():
	frame.play("hover")


func _on_hitbox_mouse_exited():
	frame.play("default")


func _on_hitbox_input_event(viewport, event, shape_idx):
	print(event)
	if event is InputEventMouseButton and event.pressed:
		print('Clicked')
