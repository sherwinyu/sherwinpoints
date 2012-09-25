SP.Views.Poms ||= {}

class SP.Views.Poms.NewView extends Backbone.View
  template: JST["backbone/templates/poms/new"]

  events:
    "submit #new-pom": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (pom) =>
        @model = pom
        window.location.hash = "/#{@model.id}"

      error: (pom, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    # this.$("form").backboneLink(@model)

    return this
