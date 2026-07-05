extends Control

@onready var CreditsDialog: AcceptDialog = $CreditsDialog
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/title_screen.tscn")
	
func _on_quite_button_pressed() -> void:
	get_tree().quit()
