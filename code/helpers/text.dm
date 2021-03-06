// todo
/proc/TrimSpaces(var/message = "")
	if(!message || message == "")
		return ""
	return message

/proc/SanitizeText(var/message = "", var/max_length = 200)

	// Trim down to size.
	message = copytext(message,1,max_length)

	// Remove HTML tags.
	message = replacetext(message, "<", "")
	message = replacetext(message, ">", "")

	// Remove trailing spaces.
	message = TrimSpaces(message)
	return message

/proc/Capitalize(var/message = "")
	return "[uppertext(copytext(message,1,2))][copytext(message,2)]"

/proc/FormatAndCapitalize(var/message = "")
	message = Capitalize(message)
	if(!(copytext(message, length(message)) in list("!","?",".")))
		message += "."
	return message

/proc/Ticks2Time(var/ticks)
	var/seconds = round((ticks%600)/10)
	return "[round(ticks/600)]:[seconds >= 10 ? seconds : "0[seconds]"]"


/proc/FormatStringForSpeech(var/mob/speaker, var/message)
	message = FormatAndCapitalize(SanitizeText(copytext(message,1,120)))
	var/speak_verb = "says"
	var/ending = copytext(message, length(message))
	if(ending == "!")
		speak_verb = "exclaims"
	else if(ending == "?")
		speak_verb = "asks"
	return "<b>\The [speaker]</b> [speak_verb], \"[message]\""

/proc/File2List(var/filename, var/seperator="\n")
	if(fexists(filename) == 0)
		return list()
	var/text = file2text(filename)
	if(!text)
		return list()
	return splittext(text,seperator)
