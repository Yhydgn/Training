class Mashup.View.Map extends Backbone.View

  defaultParams:
    disableDefaultUI: true
    zoom:             8
    mapTypeId:        google.maps.MapTypeId.ROADMAP

  el: '#map'

  template: _.template """
    <h5><%= title %></h5>
    <div class='video_container'>
      <iframe class='youtube-player' type='text/html' width='640' height='385' 
          src='http://www.youtube.com/embed/<%= uri %>' frameborder='0'>
      </iframe>
    <div>
  """

  _videos: new Mashup.Collection.Videos

  render: (events, artist) =>
    $('#map').show()

    @map = new google.maps.Map @el, _.extend @defaultParams,
      center: events.first().loc()

    events.each (event) =>
      marker = @addMarker event
      @addPopup marker, event, artist

  addMarker: (event) =>
    new google.maps.Marker
      position: event.loc()
      map: @map
      title: event.desc()

  addPopup: (marker, event, artist) =>
    @_videos.search "#{artist} #{event.title}", (videos) =>
      info = new google.maps.InfoWindow
        content: @popupContent videos.first()

      google.maps.event.addListener marker, 'click', () ->
        info.open @map, marker

  popupContent: (video) =>
    if video?
      @template title: video.title, uri: video.id
    else
      return "No video was found :("
