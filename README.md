Scheduled job that will let you know about new users in Slack,
and users that got deleted. Everytime someone gets deleted or added,
you'll receive a message from Slackbot to tell you so.

# Running it

You need to set the following environment variables:
- `SLACK_HOSTNAME`: hostname to your slack domain (e.g.: cool.slack.com)
- `SLACK_SLACKBOTTOKEN`: token to post with Slackbot.
  To retrieve one, go to the "Manage" section of your slack team, then 
  go "Custom Integrations", then "Slackbot", and either use an existing
  configuration, or create a new one. Then grab the token.
- `SLACK_APITOKEN`: token to get the list of users from the API. Same
  as with slackbot's token, either create a new bot from the "manage"
  section, or use an existing token.
- `SLACK_SENDTO`: List of users you want to warn, separated by commas,
  e.g.: `@rick,@pedro,@maria`

The simplest is just to setup a cron job that runs the thing
every 5 minutes. You can get an idea of how to do that by
looking at the included crontab file.

My friend @anthonychu ported it to be deployed to an Azure function
[here](https://github.com/anthonychu/slack-user-change-alerts/).

# Code

Stuff is written in coffee. `updateUserList` is where you probably
want to start from.