function onSay(cid, words, param, channel)

	for i = 42300,42309 do	--make all arena rooms free
	setGlobalStorageValue(i, 0)
	end
	setGlobalStorageValue(60999, -1)
	
	doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,'Global flags have been reset.')
	
	return true
	
end