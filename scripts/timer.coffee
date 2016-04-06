# Description
#   A Hubot script that timer
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot timer <sec> <message> - timer
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
#  robot.respond /timer\s+(\d+)\s+(.*)$/i, (res) ->
  robot.reply /timer\s+(\d+)\s+(.*)$/i, (res) ->
    sec = res.match[1]
    message = res.match[2]
    setTimeout ->
      res.send message
    , sec * 1000
