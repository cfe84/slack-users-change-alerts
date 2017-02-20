return unless (config = require "./config")
getUsers = (require "./getUsers") config
sendMessage = (require "./sendMessage") config
archiveUsers = (require "./archiveUsers") config
fs = require "fs"

getListDelta = (listA, listB, comparer) ->
  listA.filter ((elementFromA) =>
    elementFromB = listB.find (elementFromB) => elementFromA.id is elementFromB.id
    return comparer elementFromA, elementFromB
  )

userListToString = (users) ->
  (for user in users
    (user.profile?.real_name + "(" + user.name + ")")
  ).join ","

processUserList = (update) =>
  updatedUsers = update?.members
  savedUsers = archiveUsers.loadUsers()

  addedUsers = getListDelta updatedUsers, savedUsers, (updatedUser, savedUser) -> not savedUser
  deletedUsers = getListDelta savedUsers, updatedUsers, (savedUser, updatedUser) -> (updatedUser.deleted and not savedUser.deleted) or not updatedUser

  message = []
  message.push "These users just got deleted: #{userListToString deletedUsers}" unless deletedUsers.length is 0
  message.push "These users just got added: #{userListToString addedUsers}" unless addedUsers.length is 0
  message = message.join "\n"

  config.sendTo.forEach ((user) => sendMessage message, user) unless deletedUsers.length is 0 and addedUsers.length is 0

  archiveUsers.saveUsers updatedUsers

getUsers processUserList