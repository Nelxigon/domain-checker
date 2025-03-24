Domain Checker
===

This tool checks if a given domain is free and sends the result into your preferred Telegram group. 

### Installation
In order to use this script, you will need a Telegram bot (bots for other platforms and/or mail may follow soon). 

#### Creating a new Bot and obtaining the token
As per the official Telegram API page: 
> In this context, a token is a string that authenticates your bot (not your account) on the bot API. Each bot has a unique token which can also be revoked at any time via @BotFather.
Here, it is worth mentioning that @BotFather is not a real person but a Telegram bot that creates other bots for you
1. Start the conversation with @BotFather with the comand  ```\start```
2. Create a new Bot by issuing the ```\newbot``` command
3. Choose the Display Name and Username of your Bot by typing them in the Chat.
4. You will find the API token in the message from @BotFather.
You can find more Information here: [https://core.telegram.org/bots/features#creating-a-new-bot](https://core.telegram.org/bots/features#creating-a-new-bot)

#### Obtaining the chat id(s)
The only thing that remains is to figure out the id of your chatroom. This is necessary to make POST requests to the right place. 
1. Open https://api.telegram.org/bot[YourToken]/getUpdates (replace [YourToken] with your token)
2. Message your Bot or put them in the Group of your choice
3. Reload the page above. You should get something like this:
```
{
  "ok": true,
  "result": [
    {
      "update_id": 123456789,
      "message": {
        "message_id": 10,
        "from": {
          "id": 0123456789,
          "is_bot": false,
          "first_name": "name",
          "language_code": "en"
        },
        "chat": {
          "id": 0123456789,
          "first_name": "name",
          "type": "private"
        },
        "date": 0123456789,
        "text": "Test"
      }
    }
  ]
}
```
4. You will find the chat id in the ```result.message.chat.id``` field.

#### Adjusting the script
Follow the comments in the script and fill in your values in the variables

### Automizing the Script
You can use cronjobs to execute the script every day, hour, half an hour, minute, etc. Typically once per hour suffices. Here, I execute the script every hour at the fifth minute:
```5 * * * * /home/domain-script.sh >> /home/domain-script.log 2>&1```
The last part serves the purpose of creating logs for you
