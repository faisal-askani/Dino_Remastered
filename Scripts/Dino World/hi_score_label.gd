extends Label

var score_format: int = 5  # Number of digits to display
@onready var hi_label = $"../HiLabel"

func _ready():
	set_text(str(int(GameManager.score)).pad_zeros(score_format))
	hi_label.hide()
	hide()

func _on_game_running_state_show_high_score():
	if global_score.data.high_score > GameManager.score:
		set_text(str(int(global_score.data.high_score)).pad_zeros(score_format))
		hi_label.show()
		show()

func _on_game_over_state_show_high_score():
	print("Gameover: p_score: ", GameManager.previous_score, " global score: ", global_score.data.high_score)
	if GameManager.previous_score:
		print("update hi score")
		set_text(str(int(global_score.data.high_score)).pad_zeros(score_format))
		hi_label.show()
		show()
