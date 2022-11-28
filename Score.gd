extends RichTextLabel

var score = 0 
var EnemyManager;
onready var timer = $Timer
var killstreak = 0


func _ready():
	EnemyManager = get_parent().get_node("EnemyManager")
	EnemyManager.connect("enemy_death", self, "increment_score")
	timer.connect("timeout", self,"ontimeout")
	pass
func ontimeout():
	print(killstreak)
	killstreak=0

func increment_score(point):
	timer.start()
	if(timer.time_left > 0):
		killstreak += 1
	var scoreadder = 100 * killstreak
	var label = point.get_node("Label")
	if(scoreadder>100 && scoreadder<=300):
		label.add_color_override("font_color", Color(1,.2,.2,1))
	elif(scoreadder>300 && scoreadder<600):
		label.add_color_override("font_color", Color(1,0,1,1))
	elif(scoreadder==600):
		scoreadder= 666
		label.add_color_override("font_color", Color(1,0,0,1))
	elif(scoreadder>600 && scoreadder<=900):
		label.add_color_override("font_color", Color(.1,1,.2,1))
	label.text = str(scoreadder)

	score += scoreadder
	text = "Score: " + String(score)
