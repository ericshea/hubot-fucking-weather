Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/fucking-weather.coffee')

describe 'fucking-weather', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to hello', ->
    @room.user.say('ping', '@hubot PONG').then =>
      expect(@room.messages).to.eql [
        ['ping', '@hubot PONG']
      ]