function onStepIn(cid, item, position, fromPosition)
	if item.itemid == 460 then
		position.z = position.z + 3
		doTeleportThing(cid, position, FALSE)
	else
	return false
	end
return true
end