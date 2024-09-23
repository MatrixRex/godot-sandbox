extends Node2D


@onready var health_bar: ProgressBar = $"Health-bar"
@onready var button: Button = $Button

var health = 100
var damage_value = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.init_health(health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _reduce_health(damage):
	health -= damage
	health_bar.health = health




func _on_button_pressed() -> void:
	_reduce_health(damage_value)
