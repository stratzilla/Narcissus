local openPos1 = {x=32603,y=32216,z=9, stackpos=1}
local openPos2 = {x=32604,y=32216,z=9, stackpos=1}
local closedPos1 = {x=32601,y=32216,z=9, stackpos=1}
local closedPos2 = {x=32602,y=32216,z=9, stackpos=1}
local leftSlidePos1 = {x=32593,y=32216,z=9, stackpos=1}
local leftSlidePos2 = {x=32594,y=32216,z=9, stackpos=1}
local rightSlidePos1 = {x=32606,y=32216,z=9, stackpos=1}
local rightSlidePos2 = {x=32607,y=32216,z=9, stackpos=1}
local ringPos = {x=32594,y=32214,z=9,stackpos=255}
local ringPos2 = {x=32613,y=32220,z=10,stackpos=255}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if item.itemid == 1945 then
local h = getThingFromPos(ringPos)
	if h.itemid == 2166 then
	local doorInfo1 = getThingFromPos(openPos1).uid
	local doorInfo2 = getThingFromPos(openPos2).uid
	doTransformItem(getThingFromPos(closedPos1).uid, 1026)
	doTransformItem(getThingFromPos(closedPos2).uid, 1026)
	doRemoveItem(getThingFromPos(leftSlidePos1).uid)
	doRemoveItem(getThingFromPos(leftSlidePos2).uid)
	doCreateItem (1026, 1, rightSlidePos1)
	doCreateItem (1026, 1, rightSlidePos2)
	doTransformItem(doorInfo1, 1207)
	doTransformItem(doorInfo2, 1208)
	doSendMagicEffect(ringPos, CONST_ME_HITBYFIRE)
	doRemoveItem (h.uid)
	doCreateItem (2166, 1, ringPos2)
	else return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The mechanism does not budge!") end

else
	local doorInfo1 = getThingFromPos(closedPos1).uid
	local doorInfo2 = getThingFromPos(closedPos2).uid
	doTransformItem(getThingFromPos(openPos1).uid, 1026)
	doTransformItem(getThingFromPos(openPos2).uid, 1026)
	doRemoveItem(getThingFromPos(rightSlidePos1).uid)
	doRemoveItem(getThingFromPos(rightSlidePos2).uid)
	doCreateItem (1026, 1, leftSlidePos1)
	doCreateItem (1026, 1, leftSlidePos2)
	doTransformItem(doorInfo1, 1207)
	doTransformItem(doorInfo2, 1208)
end


	
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

end