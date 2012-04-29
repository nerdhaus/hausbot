#
# pants (on|off) - report current pants status
# pants status <user> - returns the user's current pants status
#
class Pants

  constructor: (@robot) ->
    @cache = {}
    @robot.brain.on 'loaded', =>
      if @robot.brain.data.pants
        @cache = @robot.brain.data.pants

  set: (user, status) ->
    @cache[user] = status
    @robot.brain.data.pants = @cache

  get: (user) ->
    status = if @cache[user] then @cache[user] else 0
    return status


module.exports = (robot) ->
  pants = new Pants robot

  robot.hear /pants (on|off)/i, (msg) ->
    user = msg.message.user.name.toLowerCase()
    status = msg.match[1].toLowerCase()
    pants.set user, status
    if status == "on"
      msg.send "#{msg.message.user.name} is lame"
    else
      msg.send "#{msg.message.user.name} is getting the party started"

  robot.respond /pants status (\S+[^-\s])?$/i, (msg) ->
    user = msg.match[1].toLowerCase()
    status = pants.get(user)
    if status
      msg.send "#{msg.match[1]} has pants #{status}"
    else
      msg.send "I don't know about #{msg.match[1]}"