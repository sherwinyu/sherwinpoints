#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Sherwinpoints =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
window.SP  =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$ ->
  class SP.Models.Pom extends Backbone.Model
    paramRoot: 'pom'
    defaults:
      start: new Date().getTime()
      end: 25.minutes().from_now()
      description: 'newly created pom!'
      realtime: false
      successful: false
      pom_set_id: null


  class SP.Collections.PomsCollection extends Backbone.Collection
    model: SP.Models.Pom
    url: '/poms'


  class SP.Views.PomShowView extends Backbone.View
      #var template = _.template( $("#search_template").html(), variables );

    initialize: ->
      _.bindAll @
      @timer = new SP.timer

    render: ->
      vars = @model.toJSON()
      console.log @model, vars
      console.log $('#pomShowTempl').html()
      template = _.template( $('#pomShowTempl').html(), vars) #, variable: 'pom' )
      $(@el).html(template)
      @

  class SP.Views.PomsIndexView extends Backbone.View
    template: JST["backbone/templates/poms/index"]

    initialize: (poms) ->
      @poms = poms
      # @poms.bind('reset', @addAll)
      
    addOne: (pom) ->
      pomView = new SP.Views.PomShowView(model: pom)
      $('#pomCollection').append(pomView.render().el)

    addAll: ->
      @poms.each(@addOne)
      console.log 'adding all'

    render: =>
      $(@el).html(@template(poms: @poms.toJSON() ))
      @addAll()

      return this



  class SP.Item extends Backbone.Model
    defaults:
      part1: 'derp1'
      part2: 'derp2'

  class List extends Backbone.Collection
    model: SP.Item

  class ItemView extends Backbone.View
    # tagName: 'li'
    initialize: ->
      _.bindAll @
      @model.bind 'change',  @render
      @model.bind 'remove',  @unrender

    render: ->
      console.log "Rendering Item View", @model
      vars = @model.toJSON()
      template =  _.template( $('#testTempl').html(), vars )
      $(@el).html( template) #, {part1: @model.get('part1'), part2: @model.get('part2')})
      console.log @model.get 'part1'
      @
    unrender: =>
      $(@el).remove()

    swap: ->
      @model.set
        part1: @model.get 'part2'
        part2: @model.get 'part1'
    delete: ->
      @model.destroy()

        
    events: 
      'click .swap': 'swap'
      'click .delete': 'delete'





  class ListView extends Backbone.View
    el: $('#test')
    initialize: ->
      _.bindAll @
      console.log 'listview el is: ', @el
      @collection =  new List
      @collection.bind 'add', @appendItem
      @counter = 0
      @render()
    render: ->
      console.log 'listview el is: ', @el
      $(@el).append '<button id="button">Add List Item</button>'
      $(@el).append '<ul></ul>'

    addItem: ->
      @counter++
      item = new SP.Item
      item.set part2: "#{item.get 'part2'} #{@counter}"
      @collection.add item

    appendItem: (item) ->
      itemView = new ItemView model: item


      $('ul').append  itemView.render().el

    events: 'click #button': 'addItem'


  listView = new ListView
  pomsMainView = new SP.Views.PomsMainView
# pomView = new SP.Views.PomShowView model: new SP.Models.Pom
# $('#pomCollection').append(pomView.render().el)
  # pomsMainView.render()
  # console.log pomsMainView.el
  $('#pomCollection').append(pomsMainView.render().el)


 
