class Sherwinpoints.Routers.PomsRouter extends Backbone.Router
  initialize: (options) ->
    @poms = new Sherwinpoints.Collections.PomsCollection()
    @poms.reset options.poms

  routes:
    "new"      : "newPom"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newPom: ->
    @view = new Sherwinpoints.Views.Poms.NewView(collection: @poms)
    $("#poms").html(@view.render().el)

  index: ->
    @view = new Sherwinpoints.Views.Poms.IndexView(poms: @poms)
    $("#poms").html(@view.render().el)

  show: (id) ->
    pom = @poms.get(id)

    @view = new Sherwinpoints.Views.Poms.ShowView(model: pom)
    $("#poms").html(@view.render().el)

  edit: (id) ->
    pom = @poms.get(id)

    @view = new Sherwinpoints.Views.Poms.EditView(model: pom)
    $("#poms").html(@view.render().el)
