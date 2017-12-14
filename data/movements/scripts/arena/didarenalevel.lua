function onStepIn(cid, item, pos, fromPosition)
	if getPlayerStorageValue(cid, 42355) == 1 and getPlayerStorageValue(cid,42309) == 1 then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,'You can now claim your reward, you\'ve earned it!')
		setGlobalStorageValue(item.actionid-1, 0) -- room free
		setPlayerStorageValue(cid, 42350, os.time()+5) -- time to kick 0
		setPlayerStorageValue(cid, 42352) -- is not in arena
		doTeleportThing(cid, arenaKickPosition, TRUE)
		setPlayerStorageValue(cid, 42309, 0) -- reset final boss kill
	elseif getPlayerStorageValue(cid, 42355) == 2 then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,'You can now claim your reward, you\'ve earned it!')
		setGlobalStorageValue(item.actionid-1, 0) -- room free
		setPlayerStorageValue(cid, 42350, os.time()+5) -- time to kick 0
		setPlayerStorageValue(cid, 42352) -- is not in arena
		doTeleportThing(cid, arenaKickPosition, TRUE)
		setPlayerStorageValue(cid, 42319, 0) -- reset final boss kill
	elseif getPlayerStorageValue(cid, 42355) == 3 then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,'You can now claim your reward, you\'ve really earned it this time!')
		setGlobalStorageValue(item.actionid-1, 0) -- room free
		setPlayerStorageValue(cid, 42350, os.time()+5) -- time to kick 0
		setPlayerStorageValue(cid, 42352) -- is not in arena
		doTeleportThing(cid, arenaKickPosition, TRUE)
		setPlayerStorageValue(cid, 42329, 0) -- reset final boss kill
	else
		doTeleportThing(cid, fromPosition, TRUE)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,'Fight the boss!')
	end
	return TRUE
end