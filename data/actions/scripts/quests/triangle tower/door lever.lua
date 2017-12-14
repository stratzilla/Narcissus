local doorPos = {x=32566,y=32119,z=7}
	
function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1945 then
		local s = getTileItemById(doorPos, 1025)
		doRemoveItem(s.uid)
	else
		local v = getTileItemById(doorPos, 431)
		doCreateItem(1025, 1, doorPos)
	end
	
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end