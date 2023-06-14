extends Area2D

@export var text_apres_50_bois = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_area_2d_area_entered(area):
	print(int(get_parent().get_parent().get_node("CharacterBody2D/Inventory/wood/quantity").text))
	if int(get_parent().get_parent().get_node("CharacterBody2D/Inventory/wood/quantity").text) >= 50:
		area.get_node("Panel/Label").text = area.text_apres_50_bois
	area.get_child(0).visible = true
	pass # Replace with function body.

func _on_area_2d_area_exited(area):
	area.get_child(0).visible = false
	pass # Replace with function body.
