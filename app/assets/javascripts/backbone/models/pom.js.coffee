class Sherwinpoints.Models.Pom extends Backbone.Model
  paramRoot: 'pom'

  defaults:
    start: null
    end: null
    description: null
    realtime: null
    successful: null
    pom_set_id: null

class Sherwinpoints.Collections.PomsCollection extends Backbone.Collection
  model: Sherwinpoints.Models.Pom
  url: '/poms'
