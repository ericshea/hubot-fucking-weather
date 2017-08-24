# Description
#   Hubot script for the fucking weather
#
# Configuration:
#   None
#
# Commands:
#   hubot weather - the weather for default zip code 53703
#   hubot weather zipCode - the weather for inputted zipCode
#
# Author:
#   Eric Shea <ericshea00@gmail.com>

APIKEY = process.env.HUBOT_OWM_APIKEY or null

# Madison, WI
defaultZipCode = "53703"
openWeatherApiVersion = "2.5"
openWeatherApiUrl = "http://api.openweathermap.org/data/"
openWeatherApiUnits = "imperial"

# example url: http://api.openweathermap.org/data/2.5/weather?zip=53719&appid=36d37482dbe154874f640c25e4be2b57

module.exports = (robot) ->
    robot.respond /weather$/i, (res) ->
        url = "#{openWeatherApiUrl}#{openWeatherApiVersion}/weather?units=#{openWeatherApiUnits}&zip=#{defaultZipCode}&appid=#{APIKEY}"
        getWeather(url, res)
                
    robot.respond /weather (.*)/i, (res) ->
        zipCode = res.match[1]
        url = "#{openWeatherApiUrl}#{openWeatherApiVersion}/weather?units=#{openWeatherApiUnits}&zip=#{zipCode}&appid=#{APIKEY}"
        getWeather(url, res)

    getWeather = (url, res) ->
        if APIKEY == null
            res.send "HUBOT_OWM_APIKEY environment variable is not provided for hubot-fucking-weather"
            return

        robot.http(url)
            .get() (err, resp, body) ->
                if err
                    res.send "Encountered an error :( #{err}"
                    return

                data = JSON.parse body
                remark = getRemark(data.main.temp)
                messageText = "#{remark} - #{data.name} : #{data.main.temp} (low: #{data.main.temp_min} high:#{data.main.temp_max})"
                res.send({ 'attachments' : [{ 'text' : messageText }] });

    getRemark = (temp) ->
        remark = switch
            when temp <= 0 then "IT'S REALLY FUCKING COLD!"
            when temp < 32 and temp > 0 then "IT'S FUCKING COLD!"
            when temp < 60 and temp > 32 then "IT'S FUCKING CHILLI!"
            when temp < 80 and temp > 60 then "IT'S FUCKING NICE!"
            when temp < 100 and temp > 80 then "IT'S FUCKING HOT!"
            when temp > 100 then "IT'S REALLY FUCKING HOT!"
            else "I DON'T FUCKING KNOW!"