-- The Forgotten Server Config

	-- Extras configs
		-- General
		generateAccountSalt = false
		allowedMaxSizedPackets = 3
		mysqlReconnectionAttempts = 3
		tradelimit = 100
		skipItemsVersionCheck = true
		healPlayersOnLevelAdvance = true
		tibiaClassicSlots = true
		useCapSystem = true
		useMultiClient = true
		savePlayerData = true
		houseSkipInitialRent = true
		houseProtection = true
		enableProtectionQuestForGM = true

		-- Rook System
		enableRookSystem = false
		rookLevelTo = 0
		rookTownId = 3

		-- Mailbox Block
		mailMaxAttempts = 2
		mailBlockPeriod = 60 * 60 * 1000
		mailAttemptsFadeTime = 60 * 60 * 1000

		-- Depot System
		-- 1000 depot limet defined on depot.cpp
		defaultDepotSizePremium = 5000
		defaultDepotSizefree = 3500

		-- Spawns
		noDisableBlockRespawn = true
		monstersGoBackToSpawn = false

		-- Summons
		noShareExpSummonMonster = false

		-- Spells
		unifiedSpells = true

		-- RSA
		-- NOTE: These should not be changed unless you know what your doing!
		-- Prime1 - known as p; Prime2 - known as q; Public - known as e;
		-- Modulus - known as n; Private - known as d.
		-- How make custom client with custom RSA Key: http://vapus.net/customclient
		rsaPrime1 = "14299623962416399520070177382898895550795403345466153217470516082934737582776038882967213386204600674145392845853859217990626450972452084065728686565928113"
		rsaPrime2 = "7630979195970404721891201847792002125535401292779123937207447574596692788513647179235335529307251350570728407373705564708871762033017096809910315212884101"
		rsaPublic = "65537"
		rsaModulus = "109120132967399429278860960508995541528237502902798129123468757937266291492576446330739696001110603907230888610072655818825358503429057592827629436413108566029093628212635953836686562675849720620786279431090218017681061521755056710823876476444260558147179707119674283982419152118103759076030616683978566631413"
		rsaPrivate = "46730330223584118622160180015036832148732986808519344675210555262940258739805766860224610646919605860206328024326703361630109888417839241959507572247284807035235569619173792292786907845791904955103601652822519121908367187885509270025388641700821735345222087940578381210879116823013776808975766851829020659073"

		-- Removed Config
		-- useHouseDataStorage = false
		-- houseDataStorage (binary-tilebased) or (binary) performs much faster map saving than relational (up to 60x faster).
		-- binary - uses house_data table to store house data in giant blob for each house.
		-- binary-tilebased - uses tile_store table to store house data in blob for each tile (benefit: if blob becomes corrupted, only specific tile will be wiped, not entire house).
		-- relational - uses `tiles` and `tile_items` tables, doesn't store data in blob, easier to manage but is up to 60 times slower and uses up more space in database.
		-- Default: binary-tilebased
		houseDataStorage = "binary-tilebased"

	-- Account manager
	accountManager = false
	namelockManager = false
	newPlayerChooseVoc = false
	newPlayerSpawnPosX = 32369
	newPlayerSpawnPosY = 32241
	newPlayerSpawnPosZ = 7
	newPlayerTownId = 3
	newPlayerLevel = 8
	newPlayerMagicLevel = 0
	generateAccountNumber = false

	-- Unjustified kills
	-- NOTE: *Banishment and *BlackSkull variables are >summed up<
	-- (dailyFragsToRedSkull + dailyFragsToBanishment) with their
	-- *RedSkull equivalents.
	-- Auto banishing works only if useBlackSkull set to negative.
	-- advancedFragList is not advised if you use huge frags
	-- requirements.
	useFragHandler = true
	redSkullLength = 3 * 24 * 60 * 60
	blackSkullLength = 7 * 24 * 60 * 60
	dailyFragsToRedSkull = 3
	weeklyFragsToRedSkull = 10
	monthlyFragsToRedSkull = 20
	dailyFragsToBlackSkull = dailyFragsToRedSkull
	weeklyFragsToBlackSkull = weeklyFragsToRedSkull
	monthlyFragsToBlackSkull = monthlyFragsToRedSkull
	dailyFragsToBanishment = dailyFragsToRedSkull
	weeklyFragsToBanishment = weeklyFragsToRedSkull
	monthlyFragsToBanishment = monthlyFragsToRedSkull
	blackSkulledDeathHealth = 40
	blackSkulledDeathMana = 0
	useBlackSkull = false
	advancedFragList = false

	-- Banishments
	-- violationNameReportActionType 1 = just a report, 2 = name lock, 3 = player banishment
	-- killsBanLength works only if useBlackSkull option is disabled.
	notationsToBan = 3
	warningsToFinalBan = 4
	warningsToDeletion = 5
	banLength = 3 * 24 * 60 * 60
	killsBanLength = 2 * 24 * 60 * 60
	finalBanLength = 7 * 24 * 60 * 60
	ipBanishmentLength = 14 * 24 * 60 * 60
	broadcastBanishments = true
	maxViolationCommentSize = 200
	violationNameReportActionType = 2
	autoBanishUnknownBytes = false

	-- Battle
	-- NOTE: showHealingDamageForMonsters inheritates from showHealingDamage.
	-- loginProtectionPeriod is the famous Tibia anti-magebomb system.
	-- deathLostPercent set to nil enables manual mode.
	worldType = "open"
	protectionLevel = 8
	pvpTileIgnoreLevelAndVocationProtection = true
	pzLocked = 25 * 1000
	huntingDuration = 25 * 1000
	criticalHitChance = 1
	criticalHitMultiplier = 3
	displayCriticalHitNotify = true
	removeWeaponAmmunition = true
	removeWeaponCharges = true
	removeRuneCharges = true
	whiteSkullTime = 15 * 60 * 1000
	noDamageToSameLookfeet = false
	showHealingDamage = true
	showHealingDamageForMonsters = true
	fieldOwnershipDuration = 5 * 1000
	stopAttackingAtExit = false
	loginProtectionPeriod = 10 * 1000
	deathLostPercent = 10
	stairhopDelay = 1 * 1000
	pushCreatureDelay = 1 * 1000
	deathContainerId = 1987
	gainExperienceColor = 215
	addManaSpentInPvPZone = true
	squareColor = 0
	allowFightback = true
	fistBaseAttack = 7

	-- Connection config
	worldId = 0
	ip = "173.238.208.81"
	loginPort = 7171
	gamePort = 7172
	loginTries = 10
	retryTimeout = 5 * 1000
	loginTimeout = 60 * 1000
	maxPlayers = 250
	motd = "Welcome to Narcissus-OTS!"
	displayOnOrOffAtCharlist = false
	onePlayerOnlinePerAccount = true
	allowClones = false
	serverName = "Narcissus-OTS"
	loginMessage = "Welcome to Narissus-OTS!"
	statusTimeout = 5 * 60 * 1000
	replaceKickOnLogin = true
	forceSlowConnectionsToDisconnect = false
	loginOnlyWithLoginServer = false
	premiumPlayerSkipWaitList = false

	-- Database
	-- NOTE: sqlFile is used only by sqlite database, and sqlKeepAlive by mysql database.
	-- To disable sqlKeepAlive such as mysqlReadTimeout use 0 value.
	-- encryptionType can be plain, md5, sha1, sha256, sha512 or vahash.
	sqlType = "mysql"
	sqlHost = "localhost"
	sqlPort = 3306
	sqlUser = "narcissus-ots"
	sqlPass = "w2eEQwQDfy3LbTtx"
	sqlDatabase = "narc-test"
	sqlFile = "schemas/theforgottenserver.s3db"
	sqlKeepAlive = 0
	mysqlReadTimeout = 10
	mysqlWriteTimeout = 10
	encryptionType = "sha1"

	-- Deathlist
	deathListEnabled = true
	deathListRequiredTime = 1 * 60 * 1000
	deathAssistCount = 19
	maxDeathRecords = 5

	-- Guilds
	ingameGuildManagement = true
	levelToFormGuild = 20
	premiumDaysToFormGuild = 0
	guildNameMinLength = 4
	guildNameMaxLength = 20

	-- Highscores
	highscoreDisplayPlayers = 10
	updateHighscoresAfterMinutes = 60

	-- Houses
	buyableAndSellableHouses = true
	houseNeedPremium = false
	bedsRequirePremium = false
	levelToBuyHouse = 15
	housesPerAccount = 5
	houseRentAsPrice = false
	housePriceAsRent = false
	housePriceEachSquare = 400
	houseRentPeriod = "never"
	houseCleanOld = 0
	guildHalls = false

	-- Item usage
	timeBetweenActions = 1000
	timeBetweenExActions = 1000
	hotkeyAimbotEnabled = true

	-- Map
	-- NOTE: storeTrash costs more memory, but will perform alot faster cleaning.
	mapName = "map.otbm"
	mapAuthor = "Flavin"
	randomizeTiles = true
	storeTrash = true
	cleanProtectedZones = true
	mailboxDisabledTowns = ""
		-- Example disable rook depot (temple) "4"
		-- mailboxDisabledTowns = "4"

	-- Process
	-- NOTE: defaultPriority works only on Windows and niceLevel on *nix
	-- niceLevel works only on *nix systems
	-- coresUsed are seperated by comma cores ids used by server process,
	-- default is -1, so it stays untouched (automaticaly assigned by OS).
	defaultPriority = "high"
	niceLevel = 5
	coresUsed = "-1"

	-- Startup
	startupDatabaseOptimization = true
	updatePremiumStateAtStartup = true
	confirmOutdatedVersion = false

	-- Spells
	formulaLevel = 1.0
	formulaMagic = 1.0
	bufferMutedOnSpellFailure = false
	spellNameInsteadOfWords = false
	emoteSpells = false

	-- Outfits
	allowChangeOutfit = true
	allowChangeColors = true
	allowChangeAddons = true
	disableOutfitsForPrivilegedPlayers = true
	addonsOnlyPremium = false

	-- Miscellaneous
	-- NOTE: promptExceptionTracerErrorBox works only with precompiled support feature,
	-- called "exception tracer" (__EXCEPTION_TRACER__ flag).
	dataDirectory = "data/"
	logsDirectory = "data/logs/"
	bankSystem = false
	displaySkillLevelOnAdvance = true
	promptExceptionTracerErrorBox = true
	maximumDoorLevel = 250
	maxMessageBuffer = 4

	-- VIP list
	separateVipListPerCharacter = false
	vipListDefaultLimit = 250
	vipListDefaultPremiumLimit = 250

	-- Saving-related
	-- useHouseDataStorage usage may be found at README.
	saveGlobalStorage = true
	storePlayerDirection = false

	-- Loot
	-- monsterLootMessage 0 to disable, 1 - only party, 2 - only player, 3 - party or player (like Tibia's)
	checkCorpseOwner = false
	monsterLootMessage = 0
	monsterLootMessageType = 25

	-- Ghost mode
	ghostModeInvisibleEffect = true
	ghostModeSpellEffects = true

	-- Limits
	idleWarningTime = 14 * 60 * 1000
	idleKickTime = 15 * 60 * 1000
	reportsExpirationAfterReads = 1
	playerQueryDeepness = 2
	tileLimit = 0
	protectionTileLimit = 0
	houseTileLimit = 0

	-- Premium-related
	freePremium = true
	premiumForPromotion = true

	-- Blessings
	-- NOTE: blessingReduction* regards items/containers loss.
	-- eachBlessReduction is how much each bless reduces the experience/magic/skills loss.
	blessings = true
	blessingOnlyPremium = false
	blessingReductionBase = 30
	blessingReductionDecrement = 5
	eachBlessReduction = 1.5

	-- Rates
	-- NOTE: experienceStages configuration is located in data/XML/stages.xml.
	-- rateExperienceFromPlayers 0 to disable.
	experienceStages = true
	rateExperience = 5.0
	rateExperienceFromPlayers = 0
	rateSkill = 6.0
	rateMagic = 5.0
	rateLoot = 2.25
	rateSpawn = 2

	-- Monster rates
	rateMonsterHealth = 1.00
	rateMonsterMana = 1.00
	rateMonsterAttack = 0.95
	rateMonsterDefense = 0.95

	-- Experience from players
	-- NOTE: min~Threshold* set to 0 will disable the minimum threshold:
	-- player will gain experience from every lower leveled player.
	-- max~Threshold* set to 0 will disable the maximum threshold:
	-- player will gain experience from every higher leveled player.
	minLevelThresholdForKilledPlayer = 0.9
	maxLevelThresholdForKilledPlayer = 1.1

	-- Stamina
	-- NOTE: Stamina is stored in miliseconds, so seconds are multiplied by 1000.
	-- rateStaminaHits multiplies every hit done a creature, which are later
	-- multiplied by player attack speed.
	-- rateStaminaGain is multiplying every second of logged out time, eg:
	-- 60 * 1000 / 3 = 20 seconds, what gives 1 stamina minute for 3 being logged off.
	-- rateStaminaThresholdGain is dividing in case the normal gain (that is
	-- multiplied by rateStaminaGain, btw.) passed above threshold, eg:
	-- 60 * 1000 / 3 = 20 / 4 = 5 seconds (3 * 4 = 12 minutes for 1 stamina minute).
	-- staminaRatingLimit* is in minutes.
	rateStaminaLoss = 1
	rateStaminaGain = 3
	rateStaminaThresholdGain = 12
	staminaRatingLimitTop = 40 * 60
	staminaRatingLimitBottom = 14 * 60
	staminaLootLimit = 14 * 60
	rateStaminaAboveNormal = 1.5
	rateStaminaUnderNormal = 0.5
	staminaThresholdOnlyPremium = true

	-- Party
	-- NOTE: experienceShareLevelDifference is float number.
	-- experienceShareLevelDifference is highestLevel * value
	experienceShareRadiusX = 30
	experienceShareRadiusY = 30
	experienceShareRadiusZ = 1
	experienceShareLevelDifference = 2 / 3
	extraPartyExperienceLimit = 20
	extraPartyExperiencePercent = 5
	experienceShareActivity = 2 * 60 * 1000

	-- Global save
	-- NOTE: globalSaveHour means like 03:00, not that it will save every 3 hours,
	-- if you want such a system please check out data/globalevents/globalevents.xml.
	globalSaveEnabled = false
	globalSaveHour = 8
	globalSaveMinute = 0
	shutdownAtGlobalSave = true
	cleanMapAtGlobalSave = false

	-- Spawns
	deSpawnRange = 99
	deSpawnRadius = 999

	-- Summons
	maxPlayerSummons = 2
	teleportAllSummons = false
	teleportPlayerSummons = false

	-- Status
	statusPort = 7171
	ownerName = "Robert Scott and Patrick Flavin"
	ownerEmail = "stratzillab@gmail.com"
	url = "http://narc-ots.com"
	location = "Canada"
	displayGamemastersWithOnlineCommand = true

	-- Logs
	-- NOTE: This kind of logging does not work in GUI version.
	-- For such, please compile the software with __GUI_LOGS__ flag.
	displayPlayersLogging = true
	prefixChannelLogs = ""
	runFile = ""
	outputLog = ""
	truncateLogsOnStartup = false

	-- Manager
	-- NOTE: managerPassword left blank disables manager.
	managerPort = 7171
	managerLogs = true
	managerPassword = ""
	managerLocalhostOnly = true
	managerConnectionsLimit = 1

	-- Admin
	-- NOTE: adminPassword left blank disables manager.
	-- Set to anything if you set adminRequireLogin to false.
	-- adminEncryption available options: rsa1024xtea;
	-- remember to set correct data!
	adminPort = 7171
	adminLogs = true
	adminPassword = ""
	adminLocalhostOnly = true
	adminConnectionsLimit = 1
	adminRequireLogin = true
	adminEncryption = ""
	adminEncryptionData = ""
