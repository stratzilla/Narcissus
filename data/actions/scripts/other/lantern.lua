function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	if item.itemid == 3743 then
		doTransformItem(item.uid, 4404)
	elseif item.itemid == 4404 then
		doTransformItem(item.uid, 3743)
	end
	
end