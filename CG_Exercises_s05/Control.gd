# Name: Sebastian Hegmann
# Fakultät: Mathematik und Informatik
# Studiengang: Angewandte Informatik
# Matrikelnummer: 3539941

# coauthor: 
# Name: Oliver Mautschke
# Fakultät: Mathematik und Informatik
# Studiengang: Angewandte Informatik
# Matrikelnummer: 3538495

extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_parent()._reset_game()