Sherwinpoints.Views.Poms ||= {}

class Sherwinpoints.Views.Poms.PomView extends Backbone.View
  template: JST["backbone/templates/poms/pom"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
