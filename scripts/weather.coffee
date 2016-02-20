# scripts/weather.coffee
module.exports = (robot) ->
  robot.hear /tenki$/i, (msg) ->
    request = require('request');
    request.get("http://weather.livedoor.com/forecast/webservice/json/v1?city=130010", (error, response, body) ->
      if error or response.statusCode != 200
        return msg.send('API通信に失敗しました...')
      data = JSON.parse(body)
      robot.logger.info data.forecasts
      msg.send "今日の天気:#{data.forecasts[0].telop}"
      msg.send "明日の天気:#{data.forecasts[1].telop}"
    )