console.log "derp"


window.SP = Ember.Application.create
  Router: Ember.Router.extend
    enableLogging: true
    root: Ember.Route.extend
      index: Ember.Route.extend
        enter: -> console.log "index entered"
        route: '/'

  ApplicationController: Ember.Controller.extend()

  ApplicationView: Ember.View.extend
    templateName:  'application'

  ready: ->
    console.log "ember.SP.load"


SP.initialize()

      

