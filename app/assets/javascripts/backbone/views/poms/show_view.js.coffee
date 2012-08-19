Sherwinpoints.Views.Poms ||= {}

class Sherwinpoints.Views.Poms.ShowView extends Backbone.View
  template: JST["backbone/templates/poms/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
