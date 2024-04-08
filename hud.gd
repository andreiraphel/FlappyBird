extends CanvasLayer

func update_score(new_score):
	$Score.text = str(new_score)
	
func final_score():
	$FinalScore.text = $Score.text
