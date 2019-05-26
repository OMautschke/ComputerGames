extends Area2D

signal test
#var extendedSpace = preload("res://ExtendedSpace.gd")

func _on_wall_area_entered( area ):
	if area.get_name() == "ball":
		if self.name == "left_wall":
			#extendedSpace.setP1Points()
			emit_signal("test")
			#pass
		if self.name == "right_wall":
			#extendedSpace.setP2Points()
			pass

		#oops, ball went out of game place, reset
		area.reset()
