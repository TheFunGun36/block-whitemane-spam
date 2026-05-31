# Block Whitemane Spam
This simple addons was created to fight unwanted messages in chat from a WoW client.

## Usage
Use `/bws` or `/bws help` to see list of all available commands.

- `/bws add <prefix>` - add <prefix> to list of blocked prefixes. Any message, that starts with `<prefix>` will now be blocked. Try it yourself, by typing `<prefix>` in chat.
- `/bws remove <prefix>` - remove `<prefix>` from list of blocked prefixes.
- `/bws list` - display all blocked prefixes
- `/bws clear` - remove all entries from list of blocked prefixes

So, for example, if you suffering from typing `.spellqueue` or `.xp display` into your guild chat, type those 2 commands:
- `/bws add .xp display`
- `/bws add .spellqueue`

## Contribution
Just create an issue or send me an email, i'll add whatever feature you may need. Not going to add anything without a request. Otherwise, feel free to create a pull request, i'll merge it if it works :)

For example, i thought of regexp support. That'll be an easy implementation, if you need it.
