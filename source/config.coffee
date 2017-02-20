config =
  sendTo: process.env.SLACK_SENDTO.split ","
  slack:
    hostname: process.env.SLACK_HOSTNAME
    slackbotToken: process.env.SLACK_SLACKBOTTOKEN
    token: process.env.SLACK_APITOKEN
  archiveFile: "users.json"

unless process.env.SLACK_SENDTO and process.env.SLACK_HOSTNAME and process.env.SLACK_SLACKBOTTOKEN and process.env.SLACK_APITOKEN
  config = null
  console.error "You need to set to following environment variables: SLACK_SENDTO, " +
      "SLACK_HOSTNAME, SLACK_SLACKBOTTOKEN and SLACK_APITOKEN. Refer to README."

module.exports = config