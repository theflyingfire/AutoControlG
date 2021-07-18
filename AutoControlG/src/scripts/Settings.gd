extends Panel


func _draw():
	$TabContainer/Advanced/Panel/ScrollContainer/VBoxContainer/TextEdit.text = to_json(DataLibrary.data)
	$TabContainer/General/Panel/ScrollContainer/VBoxContainer/CheckButton.pressed = DataLibrary.data["General"]["maximize"] == "true"
	$TabContainer/General/Panel/ScrollContainer/VBoxContainer/LineEdit.text = DataLibrary.data["General"]["password"]


var file_path = "user://config"

func _on_SaveB_pressed():
	
	var data = JSON.parse($TabContainer/Advanced/Panel/ScrollContainer/VBoxContainer/TextEdit.text).result
	data["General"]["maximize"] = str($TabContainer/General/Panel/ScrollContainer/VBoxContainer/CheckButton.pressed).to_lower()
	data["General"]["password"] = $TabContainer/General/Panel/ScrollContainer/VBoxContainer/LineEdit.text
	
	
	
	var config_file = File.new()
	config_file.open(file_path, File.WRITE)
	
	config_file.store_line(to_json(data))
	
	config_file.close()
	
	
	get_tree().change_scene("res://src/scenes/EntryPoint.tscn")



func _on_ResetB_pressed():
	DataLibrary.reset_config()
	get_tree().change_scene("res://src/scenes/EntryPoint.tscn")
