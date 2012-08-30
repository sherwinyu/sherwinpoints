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


  class SP.Collections.PomCollection extends Backbone.Collection
    model: SP.Models.pom
    url: '/poms'


  class SP.Views.PomShowView extends Backbone.View
    template: _.template( $('#pomTempl').html() )
      #var template = _.template( $("#search_template").html(), variables );

    render: ->
      $(@el).html(@template)


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
      console.log "Rendering Item View", 
      vars = @model.toJSON()
      template =  _.template( $('#pomTempl').html(), vars )
      $(@el).html( template) #, {part1: @model.get('part1'), part2: @model.get('part2')})
      ###
      """ 
      <span>#{@model.get 'part1'} #{@model.get 'part2'}</span>"
      <button class="swap"> swap! </button>
      <button class="delete"> delete! </button>
      """
      ###
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
      @collection =  new List
      @collection.bind 'add', @appendItem
      @counter = 0
      @render()
    render: ->
      console.log @el
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
