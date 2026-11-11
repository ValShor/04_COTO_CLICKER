extends Node


func _on_down_button_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/main.tscn')

@export var coin_label: Label
@export var upgrade_container: VBoxContainer

func _ready() -> void:
	check_purchased_upgrades()

func update_ui() -> void:
	coin_label.text = str(Global.coins)

func _on_auto_level_coin_button_pressed(extra_arg_0: NodePath) -> void:
	if Global.can_afford(150):
		Global.spend_coins(150)
		Global.auto_coin = true
		update_ui()
		close_button(extra_arg_0)

func close_button(name_button: NodePath):
	var button = get_node(name_button) as Button
	if button:
		button.disabled = true
		if not Global.purchased_upgrades.has(name_button):
			Global.purchased_upgrades.append(name_button)

func check_purchased_upgrades() -> void:
	coin_label.text = str(Global.coins)
	for button_path in Global.purchased_upgrades:
		var button = get_node_or_null(button_path) as Button
		if button:
			button.disabled = true

func _on_button_10_pressed(extra_arg_0: NodePath, extra_arg_1: int, extra_arg_2: int) -> void:
	if Global.can_afford(extra_arg_1):
		Global.spend_coins(extra_arg_1)
		Global.coins_per_click = extra_arg_2
		close_button(extra_arg_0)
		update_ui()

func _on_button_30_pressed(extra_arg_0: NodePath, extra_arg_1: int, extra_arg_2: int) -> void:
	if Global.can_afford(extra_arg_1):
		Global.spend_coins(extra_arg_1)
		Global.coins_per_click = extra_arg_2
		close_button(extra_arg_0)
		update_ui()

func _on_button_250_pressed(extra_arg_0: NodePath, extra_arg_1: int, extra_arg_2: int) -> void:
	if Global.can_afford(extra_arg_1):
		Global.spend_coins(extra_arg_1)
		Global.coins_per_click = extra_arg_2
		close_button(extra_arg_0)
		update_ui()

func _on_level_coin_button_pressed(extra_arg_0: NodePath, extra_arg_1: int, extra_arg_2: int) -> void:
	if Global.can_afford(extra_arg_1):
		Global.spend_coins(extra_arg_1)
		Global.coins_per_click = extra_arg_2
		close_button(extra_arg_0)
		update_ui()


func _on_button_ruletka_pressed() -> void:
	var bet_price = 50 # Цена одного клика
	if Global.can_afford(bet_price):
		Global.spend_coins(bet_price)
		
		# запуск рулетки
		var is_win = randf() > 0.5 # 50% шанс (выше 0.5 - победа)
		if is_win:
			Global.coins += 300
		else:
			Global.coins = 0
		update_ui()
