SP.Views.Poms ||= {}

class SP.Views.Poms.ShowView extends Backbone.View
  template: JST["backbone/templates/poms/show"]

  initialize: ->
    _.bindAll @
    @timer = new SP.timer

  render: ->
    #     $(@el).html(@template(@model.toJSON() ))
    vars = @model.toJSON()
    console.log @model, vars
    console.log $('#pomShowTempl').html()
    # template = _.template( $('#pomShowTempl').html(), vars) #, variable: 'pom' )
    $(@el).html(@template)
    @
