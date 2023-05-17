extends Label


var score = 0


func _on_enemy_defeated():
	score += 1
	text = "Score: %s" % score
