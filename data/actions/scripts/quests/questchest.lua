function onUse(cid, item, fromPosition, itemEx, toPosition)

		local playerCap = getPlayerFreeCap(cid)
		local itemWeight = getItemWeightById(item.uid)
		
		if getPlayerStorageValue(cid, item.uid) == -1 then
			if playerCap >= itemWeight then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a ' .. getItemNameById(item.uid) .. '.')
				doPlayerAddItem(cid, item.uid, 1)
				setPlayerStorageValue(cid, item.uid, 1)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a ' .. getItemNameById(item.uid) .. ' weighing ' .. itemWeight .. ' oz. It\'s too heavy for you to take.')
				return false
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The box is empty.")
			return false
		end
		return true	
	
end