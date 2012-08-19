Sherwinpoints.Views.Poms ||= {}

class Sherwinpoints.Views.Poms.IndexView extends Backbone.View
  template: JST["backbone/templates/poms/index"]

  initialize: () ->
    @options.poms.bind('reset', @addAll)

  addAll: () =>
    @options.poms.each(@addOne)

  addOne: (pom) =>
    view = new Sherwinpoints.Views.Poms.PomView({model : pom})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(poms: @options.poms.toJSON() ))
    @addAll()

    return this
