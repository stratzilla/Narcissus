function onStepIn(cid, item, position, fromPosition)
	local boots = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	if item.actionid == 189 and boots.itemid == 2195 then
		position.y = position.y + 3
		doTeleportThing(cid, position, FALSE)
	elseif item.actionid == 190 and boots.itemid == 2195 then
		position.y = position.y - 3
		doTeleportThing(cid, position, FALSE)
	else
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "You don't dare jump over that gap.")
		doTeleportThing(cid, fromPosition, FALSE)
	end
end