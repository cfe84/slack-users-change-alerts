https = require "https"

module.exports = (config) -> (callback) ->
  https.get "https://slack.com/api/users.list?token=#{config.slack.token}&pretty=1",
    (res) =>
      result = ""
      res.on 'data', (data) =>
        result += "#{data}"
      res.on "end", () =>
        callback JSON.parse result