local timesWarned = 0
local cleanHours = 9

function onThink(interval, lastExecution, thinkInterval)
	timesWarned = timesWarned + 1
	if timesWarned <= 3 then
		doBroadcastMessage("The map will be cleaned of junk in "..cleanHours.." hours.")
		cleanHours = cleanHours - 3
		if cleanHours == 0 then
			cleanHours = 9
		end
	elseif timesWarned == 4 then
		timesWarned = 0
	end
	return true
end