extends Node2D

const MyScene = preload("res://Scenes/random_character2.tscn")
var _points: Array[Vector2] = []
var _spriteDimension: Vector2
var _enemyCount : int = 0
var _current_score = 0
@export var characters_by_level: Array[int] = [5,6,7,8]
@export var current_level: int = 1

func _ready() -> void:
	setup_level(current_level)

# Called when the node enters the scene tree for the first time.
func setup_level(level_number: int) -> void:
	if( level_number < 1 or level_number > characters_by_level.size() ):
		return
		
	var characters_amount = characters_by_level[level_number-1]
	_enemyCount = characters_amount
	var instance = MyScene.instantiate()
	var area = instance as Area2D
	var sp = area.get_child(0) as Sprite2D
	_spriteDimension = sp.texture.get_size()
	var min_dimension = min(_spriteDimension[0]/2, _spriteDimension[1]/2)
	instance.queue_free()
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	_points.resize(characters_amount)
	
	for index in range(len(_points)):
		_points[index] = Vector2(rng.randf_range(min_dimension, 400.0), rng.randf_range(min_dimension, 400.0))
		instance = MyScene.instantiate()
		instance.enemy_hit.connect(_on_enemy_hit)
		area = instance as Area2D
		sp = area.get_child(0) as Sprite2D
		area.position = _points[index]
		
		add_child(area)

func _on_enemy_hit():
	_increase_score()
	_enemyCount = _enemyCount - 1
	if(_enemyCount == 0):
		current_level = current_level + 1
		setup_level(current_level)

func _increase_score():
	_current_score = _current_score + 10
	var score_label = $Score
	score_label.text = str(_current_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
