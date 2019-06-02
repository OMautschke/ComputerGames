# Name: Sebastian Hegmann
# Fakultät: Mathematik und Informatik
# Studiengang: Angewandte Informatik
# Matrikelnummer: 3539941

# coauthor: 
# Name: Oliver Mautschke
# Fakultät: Mathematik und Informatik
# Studiengang: Angewandte Informatik
# Matrikelnummer: 3538495

extends "res://wall.gd"

# Called when the node enters the scene tree for the first time.
func _on_wall_area_entered( area ):
	var gui = get_parent().get_node("GUI")
	if area.get_name() == "ball":
		gui._increase_score(2)
		
		if gui.get_p1score() == 3:
			gui.game_finished()
			return
			
		if gui.get_p2score() == 3:
			gui.game_finished()
			return
		area.reset()
