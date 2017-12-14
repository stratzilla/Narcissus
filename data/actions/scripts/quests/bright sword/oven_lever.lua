local ovenPosClosed = {x=32623,y=32188,z=9}
local ovenPosOpened = {x=32623,y=32189,z=9}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.itemid == 1946 then
	local h = getTileItemById(ovenPosClosed, 1786)
	if h.uid == 0 then return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Turn the oven back on.") end
	doRemoveItem(h.uid)
	doCreateItem (1786, 1, ovenPosOpened)
else
	local h = getTileItemById(ovenPosOpened, 1786)
	if h.uid == 0 then return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Turn the oven back on.") end
	doRemoveItem(h.uid)
	doCreateItem (1786, 1, ovenPosClosed)
end


	
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

end