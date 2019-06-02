# Name: Sebastian Hegmann
# Fakultät: Mathematik und Informatik
# Studiengang: Angewandte Informatik
# Matrikelnummer: 3539941

# coauthor: 
# Name: Oliver Mautschke
# Fakultät: Mathematik und Informatik
# Studiengang: Angewandte Informatik
# Matrikelnummer: 3538495

extends TextureRect


var ball

func _ready():
	self.ball = get_parent().get_parent().get_node("ball")


func _visibility_changed():
	self.ball.set_speed(0, Vector2(0, 0))
