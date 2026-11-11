extends Node

func _on_pressed() -> void:
	Global.coins = 0
	Global.coins_per_click = 1
	Global.auto_coin = false
	Global.purchased_upgrades.clear()
	get_tree().change_scene_to_file('res://scenes/main.tscn')

func _on_button_pressed() -> void:
	Global.save_game()

func _on_cont_button_pressed() -> void:
	Global.load_game()

func _on_exit_button_pressed() -> void:
	get_tree().quit()
