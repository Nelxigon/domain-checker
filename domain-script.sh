#!/bin/bash

# Put in the domain of which you want to check whether it is free
#
# domain=[Your Domain]
domain=""
info=$(whois "$domain")

# Depending on what the whois has put in one of the following
#
# search="This domain is currently available for application via the Identity Digital Dropzone service"
# search="pendingDelete"
search=""

# Insert the token of your telegram bot, the id of your main chat and the id of the chat you want the "whois" outputs to be sent to (to double check the result)
# If you want all messages to be sent to the same chatroom, set the two ids to the same value
#
# token="[Your Token]"
# id="[Your chat id]"
# debug="[Debug chat id]"
token=""
id=""
debug=""

if [ $(grep -c "$search" <<< "$info") -gt 0 ] ; then 
	curl -X POST "https://api.telegram.org/bot${token}/sendMessage" -d "chat_id=${debug}" -d "text=${domain} is not free"
	curl -X POST "https://api.telegram.org/bot${token}/sendMessage" -d "chat_id=${debug}" -d text="$info"
else
	curl -X POST "https://api.telegram.org/bot${token}/sendMessage" -d "chat_id=${id}" -d "text=${domain} IS FREE!!"
	curl -X POST "https://api.telegram.org/bot${token}/sendMessage" -d "chat_id=${debug}' -d text="$info"
fi
