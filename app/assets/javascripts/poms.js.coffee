# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  window.ui = 
    bindings: ->
      $('#buttonNewPom').click ->
        console.log 'hi'
        do newPom
    init: ->
      $("#timerDisplay").hide()


newPom = ->
  do $("#timerDisplay").show



$ ->
  console.log 'doc ready'
  do ui.bindings
  do ui.init


