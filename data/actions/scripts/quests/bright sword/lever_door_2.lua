local openPos = {x=32603,y=32216,z=9, stackpos=1}
local barrelPos = {x=32614,y=32209,z=10,stackpos=255}
local ringPos = {x=32613,y=32220,z=10,stackpos=255}
local wPos1 = {x=32614,y=32205,z=10, stackpos=1}
local wPos2 = {x=32614,y=32206,z=10, stackpos=1}
local wPos3 = {x=32614,y=32221,z=10, stackpos=1}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1946 then
	local h = getThingFromPos(barrelPos)
	local o = getThingFromPos(ringPos)
		if h.itemid == 1774 and o.itemid == 2166 then
			doTransformItem(o.uid, 1025)
			doRemoveItem (getThingFromPos(wPos1).uid)
			doTransformItem(getThingFromPos(wPos2).uid, 1025)
			doRemoveItem (getThingFromPos(wPos3).uid)
			doSendMagicEffect(ringPos, CONST_ME_HITBYFIRE)	--fire effect on ring
			doRemoveItem (o.uid)	-- remove ring
		else return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The mechanism does not budge!") end
	else return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The mechanism does not budge!") end

return doTransformItem(item.uid, 1945)

end