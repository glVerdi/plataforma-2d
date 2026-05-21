extends CanvasLayer

var hearts: Array = []

func _ready():
	if has_node("HBoxContainer"):
		hearts = $HBoxContainer.get_children()
	
	# CONECTA O ALARME: Dizemos para o GameManager avisar este HUD sempre que a vida mudar
	GameManeger.health_changed.connect(update_hearts)
	
	if hearts.size() > 0:
		update_hearts()

func update_hearts():
	if hearts.size() == 0: 
		return
		
	var health = GameManeger.player_health
	
	for i in range(hearts.size()):
		if hearts[i] != null:
			if i < health:
				hearts[i].animation = "Heart"
				hearts[i].frame = 0
				hearts[i].stop()
			else:
				hearts[i].animation = "noHeart"
				hearts[i].frame = 0
				hearts[i].stop()
