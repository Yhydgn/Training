class Mashup.View.Search extends Backbone.View

  el: '#artists'

  map: new Mashup.View.Map

  _events:  new Mashup.Collection.Events
  _artists: new Mashup.Collection.Artists

  events:
    "keypress": "keyPressHandler" # Handles typing in #artists

  initialize: ->
    do @autocomplete

  keyPressHandler: (e) ->
    do @search if e.keyCode == 13

  search: =>
    @$el.autocomplete "disable"

    artist = @$el.val()
    @_events.search artist, (events) =>
      @map.render events, artist

  autocomplete: =>
    @$el.autocomplete
      delay: 500
      minLength: 3
      source: @_artists.autocomplete
