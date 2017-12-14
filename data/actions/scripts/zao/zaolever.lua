local t = {
	[4830] = {{x=32991,y=31539,z=1}, {x=32991,y=31539,z=4}},
	[4831] = {{x=32991,y=31539,z=4}, {x=32991,y=31539,z=1}},
	[4832] = {{x=32993,y=31547,z=4}, {x=33061,y=31527,z=10}},
	[4833] = {{x=33061,y=31527,z=10}, {x=32993,y=31547,z=4}}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		local i = t[item.actionid]
		local v = getTopCreature(i[1]).uid
		if isPlayer(v) then
			doTeleportThing(v, i[2])
			doSendMagicEffect(i[1], CONST_ME_TELEPORT)
			doSendMagicEffect(i[2], CONST_ME_TELEPORT)
			doTransformItem(item.uid, 1946)
		else
			return doPlayerSendCancel(cid, 'Sorry, not possible.')
		end
	else
		return doTransformItem(item.uid, 1945)
	end
end