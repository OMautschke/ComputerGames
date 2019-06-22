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
var total_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.waypoints.append(self.get_parent().get_node("sphere1"))
	self.waypoints.append(self.get_parent().get_node("sphere2"))
	self.waypoints.append(self.get_parent().get_node("sphere3"))
	self.waypoints.append(self.get_parent().get_node("sphere4"))
	self.waypoints.append(self.get_parent().get_node("sphere5"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.total_time += delta
	move(self.total_time)

func setSpeed(s):
	self.speed = s
	
func setMode(m):
	self.mode = m
	
func move(time):
	var h00 = 2 * pow(time, 3) - 3 * pow(time, 2) + 1
	var h10 = -2 * pow(time, 3) + 3 * pow(time, 2)
	var h01 = pow(time, 3) -2 * pow(time, 2) + time
	var h11 = pow(time, 3) - pow(time, 2)
	
	var p0 = Vector2(0, 0)
	var p1 = Vector2(0, 0)
	var d0 = Vector2(0, 0)
	var d1 = Vector2(0, 0)

	for i in range(self.waypoints.size()):
		var next = 0
		var prev = 0
		if i == 0:
			next = i + 1
			prev = 0
		elif i == (self.waypoints.size() - 1):
			next = self.waypoints.size() - 1
			prev = i
		else:
			next = i + 1
			prev = i

		if (self.position.distance_to(self.waypoints[i].position)) < self.waypoints[prev].position.distance_to(self.waypoints[next].position):
			p0 = self.waypoints[i].position

			p1 = self.waypoints[next].position
			
			if self.mode == 0:
				d0 = self.derivatives[i] * self.speed
				d1 = self.derivatives[next] * self.speed
			elif self.mode == 1:
				var Tk = 0.5
				d0 = Tk * (p1 - p0)
				d1 = Tk * (p1 - p0)
				
			self.position = h00 * p0 + h10 * p1 + h01 * d0 + h11 * d1
			break

	#if self.position == self.waypoints[4].position:
	#	self.position = Vector2(0, 250)