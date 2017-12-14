local stonePos = {x=33314,y=31592,z=15}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1946 then
		doCreateItem (1355, 1, stonePos)
	else
		local h = getTileItemById(stonePos, 1355)
		doRemoveItem(h.uid)
	end
	
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

end