function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isUnderWater(cid) == 0 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "You should only eat this dish while walking underwater.")
		return true
	end

	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, food, TALKTYPE_MONSTER)
	return true
end
