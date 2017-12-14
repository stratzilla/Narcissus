function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 11412 then
		doTransformItem(item.uid, 11416)
	elseif item.itemid == 11416 then
		doTransformItem(item.uid, 11412)
	elseif item.itemid == 11414 then
		doTransformItem(item.uid, 11430)
	elseif item.itemid == 11430 then
		doTransformItem(item.uid, 11414)
	end
return true
end