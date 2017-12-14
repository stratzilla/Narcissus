function executeSave()
	doSaveServer()
--	doBroadcastMessage("Server saved; next save will be in 30 minutes.")
	return true
end
	
function onThink(interval, lastExecution, thinkInterval)
--	doBroadcastMessage("Server will save in 3 minutes; please be advised you may experience lag for a brief moment.")
	addEvent(executeSave, 3 * 60 * 1000)
	return true
end
