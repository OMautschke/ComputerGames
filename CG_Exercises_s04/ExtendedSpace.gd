extends Panel


var p1Points
var p2Points


func _ready():
	var p1Name = get_node("LeftPlayerName")
	p1Name.text = "Points of Player A: "
	p1Name.add_color_override("font_color", Color(1, 0, 0))

	var p2Name = get_node("RightPlayerName")
	p2Name.text = "Points of Player B: "
	p2Name.add_color_override("font_color", Color(0, 1, 0))

	p1Points = get_node("LeftPlayerPoints")
	p1Points.text = str(0)
	p1Points.add_color_override("font_color", Color(1, 0, 0))

	p2Points = get_node("RightPlayerPoints")
	p2Points.text = str(0)
	p2Points.add_color_override("font_color", Color(0, 1, 0))

	var resetButton = get_node("Restart")
	resetButton.text = "Restart"
	resetButton.connect("pressed", self, "restart")

	var t = load("res://wall.gd").new()
	t.connect("test", self, "setP1Points")
	#self.connect("test", $wall, "setP1Points")
	set_process(true)
	
func setP1Points():
	print("hallo")
	
	#self.connect("test", self, "restart")
	p1Points.text = "hallo"

func setP2Points():
	print("hall22222o")
	#var points = get_node("RightPlayerPoints")
	p2Points.text = str(int(p2Points.text) + 1)

func restart():
	p1Points.text = str(0)
	p2Points.text = str(0)
	
func _process(delta):
	#p1Points.text = str(p1Points.text)
	#p2Points.text = str(p2Points.text)
	#update()
	pass