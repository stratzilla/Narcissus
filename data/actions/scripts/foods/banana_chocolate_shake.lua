function onUse(cid, item, fromPosition, itemEx, toPosition)
	doRemoveItem(item.uid, 1)
	doSendMagicEffect(getCreaturePosition(cid), 35)
	doCreatureSay(cid, "Chomp.", TALKTYPE_MONSTER)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You don't really know what this did to you, but suddenly you feel very happy.")
	return true
end
