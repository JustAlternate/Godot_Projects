extends CharacterBody2D


const SPEED = 400.0

@onready
var map = get_parent().get_node("map1")

func _physics_process(delta):
	
	var tile_coord = map.local_to_map(round(position))
	var tile = map.get_cell_tile_data(1, tile_coord, false)
	
	# Cette fonction est appelé a toute les frames 

	if Input.is_action_pressed('down'):
		position.y += SPEED * delta

	if Input.is_action_pressed('left'):
		position.x -= SPEED * delta
	
	if Input.is_action_pressed('up'):
		position.y -= SPEED * delta
	
	if Input.is_action_pressed('right'):
		position.x += SPEED * delta
		
	if Input.is_action_just_pressed("interact"):
		if tile != null and $Inventory/Axe.visible == true and tile.get_custom_data("breakable"):
				if tile.get_custom_data("health") > 0:
					tile.set_custom_data("health",tile.get_custom_data("health") - 1)
			
				else:
					map.erase_cell(1,tile_coord)
					map.set_cell(1,tile_coord)
					
					var wood = $Inventory/wood/quantity.text
					$Inventory/wood/quantity.text = str(int(wood) + 1)
					
			
		


	move_and_slide()

	
