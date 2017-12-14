function onStepIn(cid, item, position, fromPosition)
	if InitArenaScript == 0 then														--if the script is not yet initalized then
		InitArenaScript = 1																--initalize it
		for i = 0,9 do																	--make the arena rooms free
			setGlobalStorageValue(42300+i, 0)
			setGlobalStorageValue(42400+i, 0)
		end
		checkArenaRooms({})																--run arena room checks
	end
	local arena_room = item.actionid 													--arena_room is the action id of the teleporter used
	local player_arena = getPlayerStorageValue(cid, 42355)								--get player rank
	if getPlayerStorageValue(cid,42111) == -1 or getPlayerStorageValue(cid,arena_room-1) == 1 or getPlayerStorageValue(cid,(arena_room+10)-1) == 1 or getPlayerStorageValue(cid,(arena_room+20)-1) == 1 then
		if getGlobalStorageValue(cid, arena_room) == 0 then								--if the room is free then
			local monster_uid = type(getStorage(arena_room+100)) == 'string' and 0 or getStorage(arena_room+100)	--does a monster exist in the room?

			if monster_uid > 0 then														--if a monster exists in the room then
				if isCreature(monster_uid) == TRUE then									--if it is a creature then
					doRemoveCreature(monster_uid)										--remove it
				end
			end
			local spawn_pos = getThingPos(arena_room)
			if getPlayerStorageValue(cid, 42355) == -1 then
				local monster = doCreateMonster(arena_monsters[arena_room], {x=spawn_pos.x-1,y=spawn_pos.y-1,z=spawn_pos.z})
			elseif getPlayerStorageValue(cid, 42355) == 1 then
				local monster = doCreateMonster(arena_monsters[arena_room+10], {x=spawn_pos.x-1,y=spawn_pos.y-1,z=spawn_pos.z})
			elseif getPlayerStorageValue(cid, 42355) == 2 then
				local monster = doCreateMonster(arena_monsters[arena_room+20], {x=spawn_pos.x-1,y=spawn_pos.y-1,z=spawn_pos.z})
			end
			setGlobalStorageValue(arena_room+100, monster)
			doTeleportThing(cid, spawn_pos, TRUE)										--teleport player to the next room
			setGlobalStorageValue(arena_room, cid)										--current room becomes occupied
			setGlobalStorageValue(arena_room-1, 0)										--previous room is free
			setPlayerStorageValue(cid, 42350, os.time()+arena_room_max_time)			--sets timer
			setPlayerStorageValue(cid,42111, 1)											--has used the first teleporter
		else																			--else, if the room is not free
			doTeleportThing(cid, fromPosition, TRUE)									--push back
			doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,getCreatureName(getGlobalStorageValue(cid, arena_room))..' is now in next room. Wait a moment and try again.')
		end
	else																				--else if the monster is not dead
		doTeleportThing(cid, fromPosition, TRUE)										--push back
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,'Fight the monster!')
	end
	if arena_room == 42300 then															--if the portal is the starter one
		setPlayerStorageValue(cid, 42351, 0)											--player must pay to re-enter red knob door
		setPlayerStorageValue(cid, 42352, 1)											--player is in the arena
		setPlayerStorageValue(cid, 42309, 0) -- reset final boss kill
		setPlayerStorageValue(cid, 42319, 0) -- reset final boss kill
		setPlayerStorageValue(cid, 42329, 0) -- reset final boss kill
	end
	return TRUE
end

function checkArenaRooms(param)
	addEvent(checkArenaRooms, 1000, {})													--repeat the check in one second
	for i = 42300, 42309 do																--for each room
		local player = getGlobalStorageValue(i)											--asseses if there is a player in each room
		if isPlayer(player) == TRUE then												--if there is a player in a room
			local player_storage = getPlayerStorageValue(player, 42350)					--player_storage is the time that the player will get kicked from the arena (unix time)
			if player_storage <= os.time() then											--if kick time is less than or equal to time then
				doTeleportThing(player, arenaKickPosition, TRUE)						--teleport player out
				if getPlayerStorageValue(player, 42355) == -1 then							--if player is scrub tier they are able to use first tp again
					setPlayerStorageValue(player,42111, -1)
				end
				setPlayerStorageValue(player, 42350, 0)									--reset timer
				setGlobalStorageValue(i, 0)												--rooms are free
				doPlayerSendTextMessage(player,MESSAGE_STATUS_CONSOLE_ORANGE,'You have been kicked from arena! You have only ' .. arena_room_max_time .. ' seconds for one room.')
			elseif player_storage - 10 <= os.time() then								--10 second and less warning
				doPlayerSendTextMessage(player,MESSAGE_EVENT_DEFAULT,'You have ' .. player_storage - os.time() .. ' seconds to go to the next room!')
			end
		else
			setGlobalStorageValue(i, 0)													--rooms are free
		end
	end
end