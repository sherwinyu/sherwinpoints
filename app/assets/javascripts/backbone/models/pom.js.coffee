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
