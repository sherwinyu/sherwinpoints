Sherwinpoints.Views.Poms ||= {}

class Sherwinpoints.Views.Poms.EditView extends Backbone.View
  template : JST["backbone/templates/poms/edit"]

  events :
    "submit #edit-pom" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (pom) =>
        @model = pom
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
