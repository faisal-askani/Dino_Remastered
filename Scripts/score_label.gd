extends Label

var score_format: int = 5  # Number of digits to display

func _ready():
	set_process(false)
	hide()

func _process(delta):
	set_text(str(int(GameManager.score)).pad_zeros(score_format))

func _on_game_running_state_run_score():
	show()
	set_process(true)

func _on_game_over_state_stop_score():
	set_process(false)
