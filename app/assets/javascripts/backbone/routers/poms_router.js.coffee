class SP.Routers.PomsRouter extends Backbone.Router
  initialize: (options) ->
    @poms = new SP.Collections.PomsCollection()
    @poms.reset options.poms

  routes:
    # "new"      : "newPom"
    "index"    : "index"
    # ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"
    # "*actions" : "defaultRoute"

  defaultRoute: (actions) ->
    alert actions


  index: ->
    @view = new SP.Views.PomsIndexView(@poms)
    $("#poms").html(@view.render().el)

  show: (id) ->
    pom = @poms.get(id)
    console.log 'show id', id

    @view = new SP.Views.PomShowView(model: pom)
    $('#pomCollection').append(@view.render().el)
    # $("#poms").html(@view.render().el)
    #
  newPom: ->
    @view = new Sherwinpoints.Views.Poms.NewView(collection: @poms)
    $("#poms").html(@view.render().el)

  edit: (id) ->
    pom = @poms.get(id)

    @view = new Sherwinpoints.Views.Poms.EditView(model: pom)
    $("#poms").html(@view.render().el)
