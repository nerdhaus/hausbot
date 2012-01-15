# Flip a table
#
# tableflip - flips a table
# putback - puts it back

module.exports = (robot) ->
  robot.respond /tableflip/i, (msg) ->
    msg.send "╯ಠ_ಠ）╯︵ ┻━┻"

  robot.respond /putback/i, (msg) ->
    msg.send "┬──┬ ノ( ゜-゜ノ)"