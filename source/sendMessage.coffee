https = require "https"

send = (config) -> (message, to) ->
  req = https.request
    port: 443
    method: "POST"
    hostname: config.slack.hostname
    path: "/services/hooks/slackbot?token=#{config.slack.slackbotToken}&channel=#{to}"
  , (res) =>
    result = ""
    res.on "data", (d) =>
      result += d
    res.on "end", () =>
      console.error res.statusCode + result if res.statusCode isnt 200
  req.write message
  req.end()

module.exports = send