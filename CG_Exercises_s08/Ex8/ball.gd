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

var prev = 0
var next = 1


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
	var next_time = time + 0.02
	var h00 = 2 * pow(next_time, 3) - 3 * pow(next_time, 2) + 1
	var h10 = -2 * pow(next_time, 3) + 3 * pow(next_time, 2)
	var h01 = pow(next_time, 3) -2 * pow(next_time, 2) + next_time
	var h11 = pow(next_time, 3) - pow(next_time, 2)
	
	var p0 = Vector2(0, 0)
	var p1 = Vector2(0, 0)
	var d0 = Vector2(0, 0)
	var d1 = Vector2(0, 0)

	var dist = self.position.distance_to(self.waypoints[next].position)
	
	if dist  < 2.0:
		self.next = next + 1 
		self.prev = prev + 1
		self.total_time = 0
	
	if next == self.waypoints.size():
		self.prev = 0
		self.next = 1
		self.position = self.waypoints[0].position

	p0 = self.waypoints[prev].position
	p1 = self.waypoints[next].position
			
	if self.mode == 0:
		d0 = self.derivatives[prev] * self.speed
		d1 = self.derivatives[next] * self.speed
	elif self.mode == 1:
		var Tk = 0.5
		d0 = Tk * (p1 - p0)
		d1 = Tk * (p1 - p0)
				
	self.position = h00 * p0 + h10 * p1 + h01 * d0 + h11 * d1
	

	#if self.position == self.waypoints[4].position:
	#	self.position = Vector2(0, 250)