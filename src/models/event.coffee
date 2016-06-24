class Mashup.Model.Event extends Backbone.Model

  venue: =>
    @get 'venue'

  desc: =>
    "#{@get('venue').country}, #{@get('venue').city}: #{@get('venue').name}"

  loc: =>
    new google.maps.LatLng @get('venue').location.lat, @get('venue').location.long
