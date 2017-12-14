function onStepIn(cid, item, position, fromPosition)
	if item.actionid > 30021 and item.actionid < 30035 then
	 	doPlayerSetTown(cid, item.actionid - 30020)
	end
	elseif item.actionid == 47486 then					---Thais Lighthouse quest teleport
		local pos = {x=32225,y=32284,z=10}
		doTeleportThing(cid, pos)
	end
	return TRUE
end