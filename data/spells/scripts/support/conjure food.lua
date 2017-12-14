local t = {
	2666, -- meat
	2671, -- ham
	2681, -- grape
	2674, -- aple
	2689, -- bread
	2690, -- roll
	2696 -- cheese
}
 
function onCastSpell(cid, var)
	if doPlayerAddItemEx(cid, doCreateItemEx(t[math.random(#t)])) ~= RETURNVALUE_NOERROR then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		return false
	end
 
	if math.random(2) == 1 then
		doPlayerAddItemEx(cid, doCreateItemEx(t[math.random(#t)]))
	end
 
	doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
	return true
end