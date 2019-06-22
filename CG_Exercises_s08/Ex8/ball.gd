extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var waypoints = []
				
var derivatives = [ Vector2(1, 0),
					Vector2(1, 1),
					Vector2(1, 1),
					Vector2(1, -1),
					Vector2(1, 0) ]
var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	self.waypoints.append(self.get_parent().get_node("sphere1"))
	self.waypoints.append(self.get_parent().get_node("sphere2"))
	self.waypoints.append(self.get_parent().get_node("sphere3"))
	self.waypoints.append(self.get_parent().get_node("sphere4"))
	self.waypoints.append(self.get_parent().get_node("sphere5"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

func setSpeed(s):
	self.speed = s
	
func move(time):
	var h00 = 2 * pow(time, 3) - 3 * pow(time, 2) + 1
	var h10 = -2 * pow(time, 3) + 3 * pow(time, 2)
	var h01 = pow(time, 3) -2 * pow(time, 2) + time
	var h11 = pow(time, 3) - pow(time, 2)
	
	for i in range(len(self.waypoints)):
		var next = 0
		var prev = 0
		if i == 0:
			next = i + 1
			prev = self.waypoints.size() - 1
		elif i == (self.waypoints.size() - 1):
			next = 0
			prev = i - 1
		else:
			next = i + 1
			prev = i - 1
		
		var p0 = self.waypoints[prev].position
		var p1 = self.waypoints[next].position
		var d0 = self.derivatives[prev] * self.speed
		var d1 = self.derivatives[next] * self.speed
		
		self.position = h00 * p0 + h10 * p1 + h01 * d0 + h11 * d1
