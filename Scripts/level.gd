extends Node2D

const MyScene = preload("res://Scenes/random_character.tscn")
var _points: Array[Vector2] = []
var _spriteDimension: Vector2
@export var characters_amount : int = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance = MyScene.instantiate()
	var sp = instance as Sprite2D
	_spriteDimension = sp.texture.get_size()
	var min_dimension = min(_spriteDimension[0]/2, _spriteDimension[1]/2)
	instance.queue_free()
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	_points.resize(characters_amount)
	
	for index in range(len(_points)):
		_points[index] = Vector2(rng.randf_range(min_dimension, 400.0), rng.randf_range(min_dimension, 400.0))
		instance = MyScene.instantiate()
		sp = instance as Sprite2D
		sp.position = _points[index]
		
		add_child(sp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
