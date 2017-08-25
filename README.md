# hubot-fucking-weather

A hubot script that does the things

See [`src/fucking-weather.coffee`](src/fucking-weather.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-fucking-weather --save`

Then add **hubot-fucking-weather** to your `external-scripts.json`:

```json
[
  "hubot-fucking-weather"
]
```

## Configuration

Required environment variables:
```
HUBOT_OWM_APIKEY - OpenWeatherMap api key (http://openweathermap.org/api)
```

Optional environment variables:
```
HUBOT_OWM_UNITS - Units used for api call. (default = imperial, other options = metric and standard)
HUBOT_OWM_SWEARING - Is swearing turned on or off. (default = off, options = on)
HUBOT_OWM_SWEAR_WORD - The swear word to use if HUBOT_OWM_SWEARING is on. (default = FUCKING)
HUBOT_OWM_ZIP - Default zip code to use in api call when none specified. (default = 53703)
```

## Sample Interaction

```
user1>> hubot weather 53818
hubot>> IT'S FUCKING NICE! - Platteville : 73.4 (low: 73.4 high:73.4)
```

## NPM Module

https://www.npmjs.com/package/hubot-fucking-weather
