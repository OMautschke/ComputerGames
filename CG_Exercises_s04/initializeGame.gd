extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	ProjectSettings.set_setting("display/window/size/resizable", false)
	ProjectSettings.set_setting("display/window/size/height", 500)
	ProjectSettings.save()


func _on_ExtendedSpace_script_changed():
	pass # Replace with function body.
