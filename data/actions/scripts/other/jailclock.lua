function onUse(cid, item, fromPosition, itemEx, toPosition)

	time = os.date('%H:%M and %S seconds')
	local timeLeft = (getPlayerStorageValue(cid, 1338) - os.time())
	if timeLeft < 0 then
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You should be out of jail already, or you shouldn\'t be in here!')
	return true
	end
	if timeLeft > 60 then
		minsLeft = math.floor(timeLeft / 60)
		secsLeft = (timeLeft % 60)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'The time is ' ..time.. ', and you will be released in ' ..minsLeft.. ' minutes and ' ..secsLeft.. ' seconds.')
		
	elseif timeLeft < 60 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'The time is ' ..time.. ', and you will be released in ' ..timeLeft.. ' seconds.')
	end
	return TRUE
	
end