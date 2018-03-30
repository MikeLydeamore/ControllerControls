local hotbar_indexes = {}

script.on_event("controllercontrols-up", function (event)
	if (game.players[event.player_index].clean_cursor()) then
		local uname = game.players[event.player_index].name
		if (hotbar_indexes[uname] == nil) then
			hotbar_indexes[uname] = 0
		end
		hotbar_indexes[uname] = hotbar_indexes[uname] + 1
		if (hotbar_indexes[uname] > 10) then
			hotbar_indexes[uname] = 1
		end

		local stack = game.players[event.player_index].get_inventory(defines.inventory.player_quickbar)[hotbar_indexes[uname]]
		game.players[event.player_index].cursor_stack.set_stack(stack)
		game.players[event.player_index].get_inventory(defines.inventory.player_quickbar)[hotbar_indexes[uname]].clear()

		
	end
	end
)

script.on_event("controllercontrols-down", function (event)
	if (game.players[event.player_index].clean_cursor()) then
		local uname = game.players[event.player_index].name
		if (hotbar_indexes[uname] == nil) then
			hotbar_indexes[uname] = 10
		end
		hotbar_indexes[uname] = hotbar_indexes[uname] - 1
		if (hotbar_indexes[uname] <= 0) then
			hotbar_indexes[uname] = 10
		end

		local stack = game.players[event.player_index].get_inventory(defines.inventory.player_quickbar)[hotbar_indexes[uname]]
		game.players[event.player_index].cursor_stack.set_stack(stack)
		game.players[event.player_index].get_inventory(defines.inventory.player_quickbar)[hotbar_indexes[uname]].clear()
		
		
	end
	end
)