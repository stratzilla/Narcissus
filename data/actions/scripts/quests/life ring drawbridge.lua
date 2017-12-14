local pos1 = {x = 32410, y = 32231, z = 10, stackpos = 0}
local pos2 = {x = 32411, y = 32231, z = 10, stackpos = 0}
local pos3 = {x = 32412, y = 32231, z = 10, stackpos = 0}
local pos4 = {x = 32410, y = 32232, z = 10, stackpos = 0}
local pos5 = {x = 32411, y = 32232, z = 10, stackpos = 0}
local pos6 = {x = 32412, y = 32232, z = 10, stackpos = 0}

function onUse(cid, item, fromPosition, itemEx, toPosition)
local t1 = getThingFromPos(pos1)
local t2 = getThingFromPos(pos2)
local t3 = getThingFromPos(pos3)
local t4 = getThingFromPos(pos4)
local t5 = getThingFromPos(pos5)
local t6 = getThingFromPos(pos6)

if t1.itemid == 5769 and t2.itemid == 5769 and t3.itemid == 5769 and t4.itemid == 5769 and t5.itemid == 5769 and t6.itemid == 5769 then
	doCreateItem(4610,1, pos1)
	doCreateItem(4610,1, pos2)
	doCreateItem(4610,1, pos3)
	doCreateItem(4610,1, pos4)
	doCreateItem(4610,1, pos5)
	doCreateItem(4610,1, pos6)
else
	doCreateItem(5769,1, pos1)
	doCreateItem(5769,1, pos2)
	doCreateItem(5769,1, pos3)
	doCreateItem(5769,1, pos4)
	doCreateItem(5769,1, pos5)
	doCreateItem(5769,1, pos6)
end

	
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

end