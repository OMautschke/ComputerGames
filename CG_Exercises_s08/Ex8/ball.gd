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
var speed = 100
var mode = 0

var prev = 0
var next = 1
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.waypoints.append(self.get_parent().get_node("sphere1"))
	self.waypoints.append(self.get_parent().get_node("sphere2"))
	self.waypoints.append(self.get_parent().get_node("sphere3"))
	self.waypoints.append(self.get_parent().get_node("sphere4"))
	self.waypoints.append(self.get_parent().get_node("sphere5"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	move(delta)

func setSpeed(s):
	self.speed = s
	
func setMode(m):
	self.mode = m
	
func move(s):
	var h00 = 2 * pow(time, 3) - 3 * pow(time, 2) + 1
	var h10 = -2 * pow(time, 3) + 3 * pow(time, 2)
	var h01 = pow(time, 3) -2 * pow(time, 2) + time
	var h11 = pow(time, 3) - pow(time, 2)
	
	var p0 = self.waypoints[self.prev].position
	var p1 = self.waypoints[self.next].position
	var d0 = self.derivatives[self.prev]
	var d1 = self.derivatives[self.next]
	
	self.position = h00 * p0 + h10 * p1 + h01 * d0 + h11 * d1
	
	if (self.position.distance_to(self.waypoints[1].position)) < 0.01:
		self.position = Vector2(0, 250)
	
	