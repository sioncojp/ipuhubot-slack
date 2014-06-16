# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot whisper <channel> <txt> - send message to channel

printf = require 'printf'

module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"

  robot.respond /HI$/i, (msg) ->
    msg.send "やあ！ぼくの名前はいぷ君だよ"

  robot.respond /ADAPTER$/i, (msg) ->
    msg.send robot.adapterName

  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    d = new Date
    hour = d.getHours()
    minute = d.getMinutes()
    img = printf "http://www.bijint.com/iwate/tokei_images/%02d%02d.jpg", hour, minute
    msg.send img

  robot.respond /DIE$/i, (msg) ->
    msg.send "Goodbye, cruel world."
    process.exit 0

  robot.respond /whisper (.*) (.*)$/i, (msg) ->
    room = msg.match[1]
    kotoba = msg.match[2]
    robot.messageRoom(room, kotoba)
