--copyrigth flaven patent penting original code do not steal
function onAdvance(cid, skill, oldLevel, newLevel)

	if skill > 6 then																--Only magic level is affected, none of the other skills below 6, ml is 7

		local mLvl = getPlayerMagLevel(cid, true)									--Variable mlvl is player magic level 
		local gMagicRate = getConfigInfo('rateMagic')								--Variable gMagicRate is the global magic rate which should stay at 5

		function round(num, idp)													--Rounding function
		  local mult = 10^(idp or 0)
		  return math.floor(num * mult + 0.5) / mult
		end
		
	if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6 or getPlayerVocation(cid) == 9 or getPlayerVocation(cid) == 10 then				--Sorcerer and Druid			
			if mLvl >= 1 and mLvl <=9 then														--Stage 1, level 1 to 9
			
				local rMagicMod = math.log10(mLvl ^ 5)
				local newRate = round((gMagicRate - rMagicMod), 4)
				doPlayerSetMagicRate(cid, newRate)
				
			elseif mLvl >= 10 and mLvl <= 24 then									--Stage 2, level 10 to 24
			
				local rMagicMod = math.log10(mLvl ^ 0.25)
				local newRate = round(((gMagicRate - 4.6) - rMagicMod), 4)
				doPlayerSetMagicRate(cid, newRate)
				
			elseif mLvl >= 25 and mLvl <= 39 then									--Stage 3, level 25-39
			
				local rMagicMod = math.log10(mLvl ^ 0.1785)
				local newRate = round(((gMagicRate - 4.7) - rMagicMod),4)
				doPlayerSetMagicRate(cid, newRate)
						
			elseif mLvl >= 40 and mLvl <= 55 then									--Stage 4, level 40-55
			
				local rMagicMod = math.log10(mLvl ^ 0.055)
				local newRate = round(((gMagicRate - 4.9) - rMagicMod),4)
				doPlayerSetMagicRate(cid, newRate)
				
			elseif mLvl >= 56 and mLvl <= 74 then
			
				local rMagicMod = math.log10(mLvl ^ 0.0262)						--Stage 5, level 56-74
				local newRate = round (((gMagicRate - 4.95) - rMagicMod),4)
				doPlayerSetMagicRate(cid, newRate)
				
			elseif mLvl >= 75 and mLvl <= 79 then									--High stages
				doPlayerSetMagicRate(cid, 0.0009)
			elseif mLvl >= 80 and mLvl <= 84 then
				doPlayerSetMagicRate(cid, 0.0005)
			elseif mLvl >= 85 and mLvl <= 89 then
				doPlayerSetMagicRate(cid, 0.0003)
			elseif mLvl >= 90 and mLvl <= 99 then
				doPlayerSetMagicRate(cid, 0.0002)
			elseif mLvl >= 100 then
				doPlayerSetMagicRate(cid, 0.0001)
			elseif mLvl == 0 then
				doPlayerSetMagicRate(cid,5)
			end
				
		
	elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 or getPlayerVocation(cid) == 11 then										--Paladins
		
			if mLvl >= 1 and mLvl <= 4 then										--Stage 1, level 1 to 4
		
			local rMagicMod = math.log10(mLvl ^ 7)
			local newRate = round((gMagicRate - rMagicMod), 4)
			doPlayerSetMagicRate(cid, newRate)
			
		elseif mLvl >= 5 and mLvl <= 9 then									--Stage 2, level 5 to 9
			
			local rMagicMod = math.log10(mLvl ^ 0.95)
			local newRate = round(((gMagicRate - 4) - rMagicMod), 4)
			doPlayerSetMagicRate(cid,newRate)
		
		elseif mLvl >= 10 and mLvl <= 20 then									--Stage 3, level 10 to 20
		
			local rMagicMod = math.log10(mLvl ^ 0.075)
			local newRate = round(((gMagicRate - 4.9) - rMagicMod), 4)
			doPlayerSetMagicRate(cid,newRate)
			
		elseif mLvl >= 21 and mLvl <= 45 then									--Stage 4, level 21 to 45
		
			local rMagicMod = math.log10(mLvl ^ 0.006)
			local newRate = round(((gMagicRate - 4.99) - rMagicMod), 4)
			doPlayerSetMagicRate(cid,newRate)
		
		elseif mLvl >= 46 then
			
			doPlayerSetMagicRate(cid, 0.0001)
				
			elseif mLvl == 0 then
		
				doPlayerSetMagicRate(cid, 5)
				
			end
		
	elseif getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 or getPlayerVocation(cid) == 12 then										--Knights done in single levels because mana req grows very quickly
				
			if mLvl == 0 then
				doPlayerSetMagicRate(cid, 3)
			elseif mLvl == 1 then
				doPlayerSetMagicRate(cid, 1)
			elseif mLvl == 2 then
				doPlayerSetMagicRate(cid, 0.25)
			elseif mLvl == 3 then
				doPlayerSetMagicRate(cid, 0.1)
			elseif mLvl == 4 then
				doPlayerSetMagicRate(cid, 0.02)
			elseif mLvl == 5 then
				doPlayerSetMagicRate(cid, 0.01)
			elseif mLvl == 6 then
				doPlayerSetMagicRate(cid, 0.005)
			elseif mLvl == 7 then
				doPlayerSetMagicRate(cid, 0.002)
			elseif mLvl == 8 then
				doPlayerSetMagicRate(cid, 0.0005)
			elseif mLvl == 9 then
				doPlayerSetMagicRate(cid, 0.0001)
			end
		
		end
	end
return true
end
--copyrigth flaven patent penting do not steal