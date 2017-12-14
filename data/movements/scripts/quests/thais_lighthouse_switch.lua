function onStepIn(cid, item, position, fromPosition)
	local pos = {x=32233,y=32276,z=9}
	local tpd = {x=32225,y=32275,z=10}
	doTransformItem(item.uid, item.itemid - 1)
	doCreateTeleport(1387,tpd,pos)
end