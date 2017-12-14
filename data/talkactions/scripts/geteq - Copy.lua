function onSay(cid, words, param, channel)
	local pid = 0
	if(param == '') then
		pid = getCreatureTarget(cid)
		if(pid == 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
			return true
		end
	else
		pid = getPlayerByNameWildcard(param)
	end
	
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " is not currently online.")
		return true
	end
	
	local slots = {'Head slot: ','Necklace slot: ','Bag type: ','Chest slot: ','Right hand: ','Left hand: ','Legs slot: ','Boots slot: ','Ring slot: ','Ammo slot: '}
	for i = 1,10 do
		if getPlayerSlotItem(pid, i).itemid ~= 0 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, slots[i] .. getItemNameById(getPlayerSlotItem(pid, i).itemid))
		end
	end
	
	return true
end