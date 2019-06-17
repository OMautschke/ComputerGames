extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var waypoints = []#self.get_parent().get_node("sphere1"),
				#self.get_parent().get_node("sphere2"),
				#self.get_parent().get_node("sphere3"),
				#self.get_parent().get_node("sphere4"),
				#self.get_parent().get_node("sphere5"),]
				
var derivatives = [ [1,0],
					[1,1],
					[1,1],
					[1,-1],
					[1,0]]
var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setSpeed(s):
	self.speed = s
	
func move(time):
	var h00 = 2 * time^3 - 3*time^2 + 1
	var h10 = -2 * time^3 + 3* time^2
	var h01 = time^3 -2 * time^2 + time
	var h11 = time^3 - time^2
	

