# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class SP.Views.PomsMainView extends Backbone.View
  # el: $('#pomsMainView')
  initialize: ->
    _.bindAll @
    console.log 'PomsMainView el: ', @el
    # @el = $('#pomsMainView')
    # @render()

  attributes: -> 
    { class: 'pmv' }


  render: ->
    console.log 'PomsMainView el: ', @el

    # template =  _.template( $('#testTempl').html(), vars )
    $(@el).text( "ello" ) #, {part1: @model.get('part1'), part2: @model.get('part2')})

    @

class UI

  bindings: ->
    $('#buttonNewPom').click ->
      console.log 'hi'
      do newPom
    $('#buttonAddMoreTime').click ->
      console.log 'I need more time'
      timer.rawTime+=5

  updateDisplay: ->
    @timerDisplay.text formatTime timer.rawTime

  startDisplaying: ->
    @timerDisplay.text timer.rawTime

  constructor: ->
    $("#timerDisplay").hide()
    @timerDisplay = $('#timerDisplay')




class SP.timer
  constructor: ->
    @timer = {}
    @rawTime = 0
   
  start: =>
    @rawTime = 5
    do @startTimer

  startTimer:  =>
    @timer = setInterval( @incrementTime, 1000)

  incrementTime: =>
    @rawTime-=1
    if @rawTime == 0
      do @timeUp
    console.log @rawTime
    do ui.updateDisplay
  timeUp: =>
    console.log "time is up"
    do @clearTimer

  clearTimer: =>
    clearInterval @timer

window.timer = new SP.timer
###
  init: ->
    @timer = {}
    @rawTime =  0
    @start = =>
      @rawTime = 5
      do @startTimer
    @startTimer = =>
      @timer = setInterval( @incrementTime, 1000)
    @incrementTime = =>
      @rawTime-=1
      if @rawTime == 0
        do @timeUp
      console.log @rawTime
      do ui.updateDisplay
    @timeUp = =>
      console.log "time is up"
      do @clearTimer
    @clearTimer = =>
      clearInterval @timer
      ###



newPom = ->
  do ui.timerDisplay.show
  timer.start()


window.formatTime = (rawTime, roundType) ->
  if roundType == "round"
    ds = Math.round(rawTime / 100) + ""
  else
    ds = Math.floor(rawTime / 100) + ""
  sec = Math.floor(rawTime / 1000)
  min = Math.floor(rawTime / 60000)
  hour = Math.floor(rawTime / 3600000)
  ds = ds.charAt(ds.length - 1)
  start() if hour >= 24
  sec = sec - 60 * min + ""
  sec = prependZeroCheck sec
  min = min - 60 * hour + ""
  min = prependZeroCheck min
  hour = prependZeroCheck hour
  hour + ":" + min + ":" + sec + "." + ds

prependZeroCheck = (time) ->
  time = time + "" # convert from int to string
  unless time.charAt(time.length - 2) == ""
    time = time.charAt(time.length - 2) + time.charAt(time.length - 1)
  else
    time = 0 + time.charAt(time.length - 1)

$ ->
  console.log 'doc ready'
  window.ui = new UI
  do ui.bindings
  console.log formatTime(2500, "")



  # @view = new SP.Views.Poms.IndexView(window.router.poms)
  # $("#poms").html(@view.render().el)
