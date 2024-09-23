extends ProgressBar


@onready var timer: Timer = $Timer
@onready var delayed_bar: ProgressBar = $"Delayed bar"

var health = 0 : set = _set_health


func _set_health(new_health):

	var prev_health = health
	health = min(max_value, new_health)
	value = health

	if health <= 0:
		queue_free()

	if health < prev_health:
		timer.start()

	else:
		delayed_bar.value = health


func init_health(_health):
	health = _health
	max_value = health
	value = health
	delayed_bar.max_value = health
	delayed_bar.value = health



func _on_timer_timeout() -> void:
	var tween = get_tree().create_tween()

	tween.tween_property(delayed_bar, "value", health, 0.2)
