# scripts/hello.coffee
module.exports = (robot) ->
  robot.hear /HELLO$/i, (msg) ->
    msg.send "world"
