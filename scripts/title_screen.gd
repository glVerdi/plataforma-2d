extends Control

@onready var CreditsDialog: AcceptDialog = $CreditsDialog
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/tropic.tscn")

func _on_credits_button_pressed() -> void:
	CreditsDialog.popup_centered(Vector2(400, 250))

func _on_quite_button_pressed() -> void:
	get_tree().quit()


func _on_rich_text_label_meta_clicked(meta: Variant) -> void:
	OS.shell_open(str(meta))
