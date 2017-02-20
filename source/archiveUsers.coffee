fs = require "fs"

archiveUsers = (config) ->
  loadUsers: => JSON.parse fs.readFileSync config.archiveFile
  saveUsers: (users) => fs.writeFileSync config.archiveFile, JSON.stringify users

module.exports = archiveUsers