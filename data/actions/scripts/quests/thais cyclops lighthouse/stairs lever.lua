local stairsPos = {x=32225,y=32282,z=10}
local holePos = {x=32225,y=32282,z=9}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1945 then
		local h = getTileItemById(holePos, 424)
		doTransformItem(h.uid, 8170)
		doCreateItem (1385, 1, stairsPos)
	else
		local h = getTileItemById(holePos, 8170)
		doTransformItem(h.uid, 424)
		local s = getTileItemById(stairsPos, 1385)
		doRemoveItem(s.uid)
	end

return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

end