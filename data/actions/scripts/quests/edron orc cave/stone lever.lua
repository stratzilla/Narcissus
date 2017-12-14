local stonePos = {x=33171,y=31897,z=8}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1946 then
		doCreateItem (1285, 1, stonePos)
	else
		local h = getTileItemById(stonePos, 1285)
		doRemoveItem(h.uid)
	end
	
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

end