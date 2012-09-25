SP.Views.Poms ||= {}

class SP.Views.Poms.PomView extends Backbone.View
  template: JST["backbone/templates/poms/show"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    console.log "model; ", @model
    $(@el).html(@template(@model.toJSON() ))
    return this
