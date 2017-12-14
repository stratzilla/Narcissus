local stonePos = {x=33297,y=31677,z=15}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1945 then
		local h = getTileItemById(stonePos, 1304)
		doRemoveItem(h.uid)
		
	else
		doCreateItem (1304, 1, stonePos)
	end
	
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

end