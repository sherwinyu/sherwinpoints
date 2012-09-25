SP.Views.Poms ||= {}

class SP.Views.Poms.IndexView extends Backbone.View
  template: JST["backbone/templates/poms/index"]

  className: 'indexView'

  events: 
    'click derp': 'addOne'

  initialize: (@poms) ->
    @poms.bind('reset', @addAll)

  addAll: () =>
    @poms.each(@addOne)

  addOne: (pom) =>
    console.log 'addOne', pom
    # pom ||= new SP.Models.Pom
    view = new SP.Views.Poms.PomView({model : pom})
    @$("#pomsCollection").append(view.render().el)

  render: =>
    $(@el).html(@template(poms: @poms.toJSON() ))
    @addAll()

    return this
