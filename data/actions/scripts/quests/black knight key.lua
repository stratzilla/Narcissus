function onUse(cid, item, fromPosition, itemEx, toPosition)
		
		if getPlayerStorageValue(cid, item.uid) == -1 then
			doItemSetAttribute(doPlayerAddItem(cid, 2088), 'aid', 5010)
			setPlayerStorageValue(cid, item.uid, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a key.')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The creaky old tree looks like it has many places to hide things, but it's empty.")
			return false
		end
		return true	
	
end