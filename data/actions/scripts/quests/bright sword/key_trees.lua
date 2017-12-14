function onUse(cid, item, fromPosition, itemEx, toPosition)
		
		if getPlayerStorageValue(cid, item.uid) == -1 then
			
			if item.uid == 45002 then
				doItemSetAttribute(doPlayerAddItem(cid, 2089), 'aid', 3301)
			elseif item.uid == 45003 then
				doItemSetAttribute(doPlayerAddItem(cid, 2088), 'aid', 3302)
			elseif item.uid == 45004 then
				doItemSetAttribute(doPlayerAddItem(cid, 2089), 'aid', 3303)
			end
			
				
			setPlayerStorageValue(cid, item.uid, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You have found a key.')
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The creaky old tree looks like it has many places to hide things, but it's empty.")
			return false
		end
		return true	
	
end