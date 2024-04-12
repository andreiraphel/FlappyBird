extends CanvasLayer

func update_score(new_score):
	$point.play()
	$Score.text = str(new_score)
	
func final_score():
	$FinalScore.text = $Score.text
