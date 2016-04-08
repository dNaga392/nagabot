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
timermsg1 = [
  '経過',
  '経ったぞ'
]
timermsg2 = [
  'の時間だ',
  'の時間じゃない？',
  'だってさ'
]
module.exports = (robot) ->
  robot.respond /timer\s+(\d+)\s+(.*)$/i, (res) ->
    sec = res.match[1]
    message = res.match[2]
    msg1 = res.random timermsg1
    msg2 = res.random timermsg2
    setTimeout ->
      res.reply "#{sec}秒#{msg1}。#{message}#{msg2}"
    , sec * 1000
