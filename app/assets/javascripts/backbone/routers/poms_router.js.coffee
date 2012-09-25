class SP.Routers.PomsRouter extends Backbone.Router
  initialize: (options) ->
    @poms = new SP.Collections.PomsCollection()
    @poms.reset options.poms

  routes:
    "new"      : "newPom"
    "/new"      : "newPom"
    "index"    : "index"
    # ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"
    "*actions" : "defaultRoute"

  defaultRoute: (actions) ->
    alert actions


  index: ->

  show: (id) ->
    pom = @poms.get(id)
    console.log 'show id', id

    @view = new SP.Views.Poms.ShowView(model: pom)
    $('#pomCollection').append(@view.render().el)
    # $("#poms").html(@view.render().el)
    
  newPom: ->
    console.log "newPom"
    @view = new SP.Views.Poms.NewView(collection: @poms)
    $("#poms").append(@view.render().el)
    console.log "newPom appended"

  edit: (id) ->
    pom = @poms.get(id)

    @view = new SP.Views.Poms.EditView(model: pom)
    $("#poms").html(@view.render().el)
