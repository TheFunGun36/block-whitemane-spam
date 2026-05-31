local OriginalSendChatMessage = SendChatMessage

function SendChatMessage(message, chatType, language, targetChannel)
	if not message then
		return
	end

	local blockedPatterns = {
		"^.spellqueue",
		"^.xp display"
	}

	for _, prefix in ipairs(blockedPatterns) do
		if string.match(message, prefix) then
			return
		end
	end

	OriginalSendChatMessage(message, chatType, language, targetChannel)
end
