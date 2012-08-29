# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
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



window.timer =
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
  do timer.init
  console.log formatTime(2500, "")

$ ->
  class Item extends Backbone.Model
    defaults:
      part1: 'derp1'
      part2: 'derp2'
  class List extends Backbone.Collection
    model: Item

  class ItemView extends Backbone.View
    tagName: 'li'
    initialize: ->
      _.bindAll @
      @model.bind 'change',  @render
      @model.bind 'remove',  @unrender

    render: ->
      console.log "Rendering Item View", $(@el).html """ 
      <span>#{@model.get 'part1'} #{@model.get 'part2'}</span>"
      <button class="swap"> swap! </button>
      <button class="delete"> delete! </button>
      """
      console.log @model.get 'part1'
      @
    unrender: =>
      $(@el).remove()

    swap: ->
      @model.set
        part1: @model.get 'part2'
        part2: @model.get 'part1'
    derp: ->
      @model.destroy()

        
    events: 
      'click .swap': 'swap'
      'click .delete': 'derp'





  class ListView extends Backbone.View
    el: $('#test')
    initialize: ->
      _.bindAll @
      @collection =  new List
      @collection.bind 'add', @appendItem
      @counter = 0
      @render()
    render: ->
      console.log @el
      $(@el).append '<button id="button">Add List Item</button>'
      $(@el).append '<ul></ul>'

    addItem: ->
      @counter++
      item = new Item
      item.set part2: "#{item.get 'part2'} #{@counter}"
      @collection.add item

    appendItem: (item) ->
      itemView = new ItemView model: item


      $('ul').append  itemView.render().el

    events: 'click #button': 'addItem'


  listView = new ListView





