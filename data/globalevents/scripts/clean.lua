function executeClean()
	doCleanMap()
	doBroadcastMessage("Map cleaned of junk and corpses; next map clean in 12 hours.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("Map will be cleaned in 30 minutes; please make sure you don't have any lootbags lying on the ground.")
	addEvent(executeClean, 30 * 60 * 1000)
	return true
end
