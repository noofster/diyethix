extends RichTextLabel

var score = 0 
var EnemyManager;

func _ready():
	EnemyManager = get_parent().get_node("EnemyManager")
	EnemyManager.connect("enemy_death", self, "increment_score")
	pass
	
func increment_score():
	score += 100
	text = "Score: " + String(score)
