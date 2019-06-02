# Name: Sebastian Hegmann
# Fakultät: Mathematik und Informatik
# Studiengang: Angewandte Informatik
# Matrikelnummer: 3539941

# coauthor: 
# Name: Oliver Mautschke
# Fakultät: Mathematik und Informatik
# Studiengang: Angewandte Informatik
# Matrikelnummer: 3538495

extends Panel

var p1_score = 0
var p2_score = 0
var winner = ""

var txtScore1
var txtScore2
var txtWinner
var ball
var logo

# Called when the node enters the scene tree for the first time.
func _ready():
	self.txtScore1 = get_node("Score1")
	self.txtScore2 = get_node("Score2")
	self.txtWinner = get_node("Winner")
	self.ball = get_parent().get_node("ball")
	self.logo = get_parent().get_node("AnimationPlayer/Logo")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _increase_score(p):
	if p == 1:
		p1_score += 1
	else:
		p2_score += 1
		
	if p1_score == 3:
		self.winner = "Player 1 Wins!"
	if p2_score == 3:
		self.winner = "Player 2 Wins!"
	update()

func _draw():
	 self.txtScore1.set_text(str(self.p1_score))
	 self.txtScore2.set_text(str(self.p2_score))
	 self.txtWinner.set_text(self.winner)
	
func game_finished():
	self.ball.reset()
	self.ball.set_speed(0, Vector2(0, 0))
	
func get_p1score():
	return self.p1_score
	
func get_p2score():
	return self.p2_score
	
func _reset_game():
	self.logo.hide()
	
	self.txtScore1.set_text(str(0))
	self.txtScore2.set_text(str(0))
	self.txtWinner.set_text("")
	self.ball.reset()
	
	var random_dir = [1, -1]
	random_dir.shuffle()
	self.ball.set_speed(self.ball.get_initial_speed(), Vector2(random_dir[0], 0))
