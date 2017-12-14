function onSay(cid, words, param, channel)
	local str,count = "",0
	for _, cid in ipairs(getPlayersOnline()) do
		if getPlayerAccess(cid) < 3 then
		  count = count + 1
                  str = str.."".. (str == "" and "" or ",") ..""..getPlayerName(cid).."["..getPlayerLevel(cid).."]"
                 end
                 end
	return doShowTextDialog(cid, 1952, count.." player(s) online:\n\n"..str)
end