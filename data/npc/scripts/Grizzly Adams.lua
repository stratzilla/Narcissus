local tasks =
{
	[1] = {questStarted = 1510, questStorage = 65000, killsRequired = 100, raceName = "Trolls", rewards = {{enable = true, type = "exp", values = 200}, {enable = true, type = "money", values = 200}}},
 
	[2] = {questStarted = 1511, questStorage = 65001, killsRequired = 150, raceName = "Goblins", rewards = {{enable = true, type = "exp", values = 300}, {enable = true, type = "money", values = 250}}},
 
	[3] = {questStarted = 1512, questStorage = 65002, killsRequired = 300, raceName = "Rotworms", rewards = {{enable = true, type = "exp", values = 1000}, {enable = true, type = "money", values = 400}}},
 
	[4] = {questStarted = 1513, questStorage = 65003, killsRequired = 500, raceName = "Cyclops", rewards = {{enable = true, type = "exp", values = 3000}, {enable = true, type = "money", values = 800}}},
 
	[5] = {questStarted = 1514, questStorage = 65004, killsRequired = 300, raceName = "Crocodiles", rewards = {{enable = true, type = "exp", values = 800}, {enable = true, type = "boss", values = THESNAPPER_POSITION}, {enable = true, type = "points", values = 2}}},
 
	[6] = {questStarted = 1515, questStorage = 65005, killsRequired = 300, raceName = "Tarantulas", rewards = {{enable = true, type = "money", values = 1500}, {enable = true, type = "boss", values = HIDE_POSITION}, {enable = true, type = "points", values = 2}}},
 
	[7] = {questStarted = 1516, questStorage = 65006, killsRequired = 150, raceName = "Carniphilas", rewards = {{enable = true, type = "exp", values = 1500}, {enable = true, type = "points", values = 1}}},
 
	[8] = {questStarted = 1517, questStorage = 65007, killsRequired = 200, raceName = "Stone Golems", rewards = {{enable = true, type = "exp", values = 2000}, {enable = true, type = "points", values = 1}}},
 
	[9] = {questStarted = 1518, questStorage = 65008, killsRequired = 300, raceName = "Mammoths", rewards = {{enable = true, type = "exp", values = 4000}, {enable = true, type = "boss", values = THEBLOODTUSK_POSITION}, {enable = true, type = "points", values = 2}}},
 
	[10] = {questStarted = 1519, questStorage = 65009, killsRequired = 300, raceName = "Ice Golems", rewards = {{enable = true, type = "exp", values = 15000}, {enable = true, type = "boss", values = SHARDHEAD_POSITION}, {enable = true, type = "points", values = 2}}},
 
	[11] = {questStarted = 1520, questStorage = 65010, killsRequired = 300, raceName = "Quaras Scout", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "points", values = 1}}},
 
	[12] = {questStarted = 1521, questStorage = 65011, killsRequired = 300, raceName = "Quaras", rewards = {{enable = true, type = "exp", values = 12000}, {enable = true, type = "boss", values = THUL_POSITION}, {enable = true, type = "points", values = 2}}},
 
	[13] = {questStarted = 1522, questStorage = 65012, killsRequired = 70, raceName = "Water Elementals", rewards = {{enable = true, type = "exp", values = 7000}, {enable = true, type = "points", values = 1}}},
 
	[14] = {questStarted = 1523, questStorage = 65013, killsRequired = 70, raceName = "Earth Elementals", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "points", values = 1}}},
 
	[15] = {questStarted = 1524, questStorage = 65014, killsRequired = 70, raceName = "Energy Elementals", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "points", values = 1}}},
 
	[16] = {questStarted = 1525, questStorage = 65015, killsRequired = 70, raceName = "Fire Elementals", rewards = {{enable = true, type = "exp", values = 7000}, {enable = true, type = "points", values = 1}}},
 
	[17] = {questStarted = 1526, questStorage = 65016, killsRequired = 200, raceName = "Mutated Rats", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "boss", values = ESMERALDA_POSITION}, {enable = true, type = "points", values = 2}}},
 
	[18] = {questStarted = 1527, questStorage = 65017, killsRequired = 500, raceName = "Giant Spiders", rewards = {{enable = true, type = "exp", values = 5000}, {enable = true, type = "boss", values = THEOLDWIDOW_POSITION}, {enable = true, type = "points", values = 2}}},
 
	[19] = {questStarted = 1528, questStorage = 65018, killsRequired = 2000, raceName = "Hydras", rewards = {{enable = true, type = "boss", values = THEMANY_POSITION}, {enable = true, type = "points", values = 4}}},
 
	[20] = {questStarted = 1529, questStorage = 65019, killsRequired = 2000, raceName = "Sea Serpents", rewards = {{enable = true, type = "boss", values = LEVIATHAN_POSITION}, {enable = true, type = "points", values = 4}}},
 
	[21] = {questStarted = 1530, questStorage = 65020, killsRequired = 2000, raceName = "Behemoths", rewards = {{enable = true, type = "boss", values = STONECRACKER_POSITION}, {enable = true, type = "points", values = 4}}},
 
	[22] = {questStarted = 1531, questStorage = 65021, killsRequired = 1500, raceName = "Serpents Spawn", rewards = {{enable = true, type = "teleport", values = THENOXIUSSPAWN_POSITION}, {enable = true, type = "points", values = 4}}},
 
	[23] = {questStarted = 1532, questStorage = 65022, killsRequired = 500, raceName = "Green Djinns", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "money", values = 5000}, {enable = true, type = "boss", values = MERIKHTHESLAUGHTERER_POSITION}}},
 
	[24] = {questStarted = 1533, questStorage = 65023, killsRequired = 500, raceName = "Blue Djinns", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "money", values = 5000}, {enable = true, type = "boss", values = FAHIMTHEWISE_POSITION}}},
 
	[25] = {questStarted = 1534, questStorage = 65024, killsRequired = 3000, raceName = "Pirates", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "money", values = 5000}, {enable = true, type = "boss", values = RANDOMPIRATEBOSS_POSITION}}},
 
	[26] = {questStarted = 1535, questStorage = 65025, killsRequired = 3000, raceName = "Pirates", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "money", values = 5000}}},
 
	[27] = {questStarted = 1536, questStorage = 65026, killsRequired = 5000, raceName = "Minotaurs", rewards = {{enable = true, type = "boss", values = THEHORNEDFOX_POSITION}}},
 
	[28] = {questStarted = 1537, questStorage = 65027, killsRequired = 4000, raceName = "Magicians", rewards = {{enable = true, type = "boss", values = NECROPHARUS_POSITION}}},
 
	[29] = {questStarted = 1538, questStorage = 65028, killsRequired = 1000, raceName = "Magicians", rewards = {{enable = true, type = "exp", values = 40000}}},
 
	[30] = {questStarted = 1539, questStorage = 65029, killsRequired = 6666, raceName = "Demons", rewards = {{enable = true, type = "storage", values = {65535, 1}}}}
}
 
 
 
local rankStorage = 32150
local choose = {}
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local voc = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
 
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
	if msgcontains(msg, "task") then
		selfSay("There you can see the following tasks, please tell me the number of the task that you want to do.", cid)
		local text = "Number  -  Name"
		for i = 1, table.maxn(tasks) do
			text = text .. "\n" .. i .. "  -  " .. tasks[i].raceName .. (getCreatureStorage(cid, tasks[i].questStarted) == 2 and " [Done]" or "")
		end
		doShowTextDialog(cid, 5956, text)
 
	elseif tasks[tonumber(msg)] then
		msg = tonumber(msg)
		if getCreatureStorage(cid, tasks[msg].questStarted) == 1 then
			selfSay("You are already making this task.", cid)
			talkState[talkUser] = 0
			return true
		end
		if getCreatureStorage(cid, tasks[msg].questStarted) == 2 then
			selfSay("You already finished this task.", cid)
			talkState[talkUser] = 0
			return true
		end
		if tasks[msg].level and getPlayerLevel(cid) < tasks[msg].level then
			selfSay("You need level " .. tasks[msg].level .. " or higher to make this task.", cid)
			talkState[talkUser] = 0
			return true
		end
		for k, v in pairs(tasks) do
			if getCreatureStorage(cid, v.questStarted) == 1 and tasks[msg] ~= k then
				selfSay("You are already making a task.", cid)
				talkState[talkUser] = 0
				return true
			end
		end
		selfSay("Are you sure that do you want to start the task number " .. msg .. "?. In this task you will need to defeat " .. tasks[msg].killsRequired .. " " .. tasks[msg].raceName .. ".", cid)
		choose[cid] = msg
		talkState[talkUser] = 1
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		doCreatureSetStorage(cid, tasks[choose[cid]].questStarted, 1)
		selfSay("You have started the task number " .. choose[cid] .. ", remember... in this task you will need to defeat " .. tasks[choose[cid]].killsRequired .. " " .. tasks[choose[cid]].raceName .. ". Good luck!", cid)
		talkState[talkUser] = 0
 
	elseif msgcontains(msg, "report") then
		for k, v in pairs(tasks) do
			if getCreatureStorage(cid, v.questStarted) == 1 then
				if getCreatureStorage(cid, v.questStorage) >= v.killsRequired then
					for i = 1, table.maxn(v.rewards) do
						if(v.rewards[i].enable) then
							if isInArray({"boss", "teleport", 1}, v.rewards[i].type) then
								doTeleportThing(cid, v.rewards[i].values)
							elseif isInArray({"exp", "experience", 2}, v.rewards[i].type) then
								doPlayerAddExperience(cid, v.rewards[i].values)
							elseif isInArray({"item", 3}, v.rewards[i].type) then
								doPlayerAddItem(cid, v.rewards[i].values[1], v.rewards[i].values[2])
							elseif isInArray({"money", 4}, v.rewards[i].type) then
								doPlayerAddMoney(cid, v.rewards[i].values)
							elseif isInArray({"storage", "stor", 5}, v.rewards[i].type) then
								doCreatureSetStorage(cid, v.rewards[i].values[1], v.rewards[i].values[2])
							elseif isInArray({"points", "rank", 2}, v.rewards[i].type) then
								doCreatureSetStorage(cid, rankStorage, getCreatureStorage(cid, rankStorage) + v.rewards[i].values)
							else
								print("[Warning - Error::Killing in the name of::Tasks config] Bad reward type: " .. v.rewards[i].type .. ", reward could not be loaded.")
							end
						end
					end
					local rank = getCreatureStorage(cid, rankStorage)
					selfSay("Great!... you have finished the task number " .. k .. "" .. (rank > 4 and ", you are a " or "") .. "" .. (((rank > 4 and rank < 10) and ("Huntsman") or (rank > 9 and rank < 20) and ("Ranger") or (rank > 19 and rank < 30) and ("Big Game Hunter") or (rank > 29 and rank < 50) and ("Trophy Hunter") or (rank > 49) and ("Elite Hunter")) or "") .. ". Good job.", cid)
					doCreatureSetStorage(cid, v.questStarted, 2)
					break
				else
					if getCreatureStorage(cid, v.questStorage) < 0 then
						doCreatureSetStorage(cid, v.questStorage, 0)
					end
					selfSay("Current " .. getCreatureStorage(cid, v.questStorage) .. " " .. v.raceName .. " killed, you need to kill " .. v.killsRequired .. ".", cid)
					break
				end
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())