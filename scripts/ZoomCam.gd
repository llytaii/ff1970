extends Camera2D


# Lower cap for the `_zoom_level`.
var min_zoom = 1.0
# Upper cap for the `_zoom_level`.
var max_zoom = 3.0
# Controls how much we increase or decrease the `_zoom_level` on every turn of the scroll wheel.
var zoom_factor = 0.1
# Duration of the zoom's tween animation.
var zoom_duration = 0.2

# The camera's target zoom level.
var zoom_level = 1.0



func set_zoom_level(value: float):
	# We limit the value between `min_zoom` and `max_zoom`
	zoom_level = clampf(value, min_zoom, max_zoom)
	# Then, we ask the tween node to animate the camera's `zoom` property from its current value
	# to the target zoom level.
	var tween = create_tween()
	tween.tween_property(self, "zoom", Vector2(zoom_level, zoom_level), zoom_duration).set_trans(Tween.TRANS_SINE)
	

func _unhandled_input(event):
	if event.is_action_released("zoom_out"):
		set_zoom_level(zoom_level - zoom_factor)
	if event.is_action_released("zoom_in"):
		set_zoom_level(zoom_level + zoom_factor)

