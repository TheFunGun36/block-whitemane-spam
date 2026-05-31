local OriginalSendChatMessage = SendChatMessage

if not BlockWhitemaneSpamDB then
	BlockWhitemaneSpamDB = {}
	print("[BlockWhitemaneSpam] Welcome! Type /bws to see available commands")
end

if not BlockWhitemaneSpamDB.blockedPatterns then
	BlockWhitemaneSpamDB.blockedPatterns = {}
end

local function AddPrefix(prefix)
	local pattern = "^" .. prefix
	if BlockWhitemaneSpamDB.blockedPatterns[prefix] then
		print("Prefix already blocked")
	else
		BlockWhitemaneSpamDB.blockedPatterns[prefix] = pattern
		print("Prefix successfully blocked")
	end
end

local function RemovePrefix(prefix)
	local pattern = "^" .. prefix
	if BlockWhitemaneSpamDB.blockedPatterns[prefix] then
		print("Prefix unblocked")
	else
		BlockWhitemaneSpamDB.blockedPatterns[prefix] = pattern
		print("Prefix wasn't blocked before. Did you mistype?")
	end
end

local function ListPrefixes()
	if not next(BlockWhitemaneSpamDB.blockedPatterns) then
		print("Block list is empty")
	else
		print("Blocked entries:")
		for k, _ in pairs(BlockWhitemaneSpamDB.blockedPatterns) do
			print("  - " .. k)
		end
	end
end

local function ClearPrefixes()
	BlockWhitemaneSpamDB.blockedPatterns = {}
	print("Successfully cleared blocked prefixes list")
end

local function HandleSlashCommand(msg)
	if not msg or msg == "" or msg == "help" then
		print("BlockWhitemaneSpam available commands:")
		print("  /bws add <text>     - Block messages starting with <text>")
		print("  /bws remove <text>  - Remove a blocked prefix")
		print("  /bws list           - Show all blocked prefixes")
		print("  /bws clear          - Remove ALL blocked prefixes")
		return
	end

	local cmd, arg = msg:match("^(%S+)%s*(.*)$")
	if cmd == "add" then
		AddPrefix(arg)
	elseif cmd == "remove" then
		RemovePrefix(arg)
	elseif cmd == "list" then
		ListPrefixes()
	elseif cmd == "clear" then
		ClearPrefixes()
	elseif cmd == "cleardebugdata" then
		print("cleared db")
		BlockWhitemaneSpamDB = nil
	end
end

SLASH_BLOCKWHITEMANESPAM1 = "/bws"
SLASH_BLOCKWHITEMANESPAM2 = "/blockwhitemanespam"
SlashCmdList["BLOCKWHITEMANESPAM"] = HandleSlashCommand

function SendChatMessage(message, chatType, language, targetChannel)
	if not message then
		return
	end

	if BlockWhitemaneSpamDB.blockedPatterns then
		for _, pattern in pairs(BlockWhitemaneSpamDB.blockedPatterns) do
			if string.match(message, pattern) then
				return
			end
		end
	end

	OriginalSendChatMessage(message, chatType, language, targetChannel)
end
