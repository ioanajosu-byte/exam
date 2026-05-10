extends TileMapLayer

func _physics_process(_delta):
	for body in get_tree().get_nodes_in_group("player"):
		# Verificăm mai multe puncte ale personajului
		var positions = [
			body.global_position,
			body.global_position + Vector2(0, 16),   # jos
			body.global_position + Vector2(16, 0),   # dreapta
			body.global_position + Vector2(-16, 0),  # stânga
		]
		
		for pos in positions:
			var tile_pos = local_to_map(to_local(pos))
			var tile_data = get_cell_source_id(tile_pos)
			
			if tile_data != -1:
				erase_cell(tile_pos)
