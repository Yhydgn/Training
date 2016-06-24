class Mashup.Application

  @v: []

  @run: ->
    Mashup.Application.v.push new Mashup.View.Search
    Mashup.Application.v.push new Mashup.View.Map
