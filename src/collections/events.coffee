class Mashup.Collection.Events extends Mashup.Collection.LastFm

  model: Mashup.Model.Event

  responsePattern: [
    '//event'
    id: 'id'
    title: 'title'
    date: 'startDate'
    url: 'url'
    venue:
      name: 'venue/name'
      city: 'venue/location/city'
      country: 'venue/location/country'
      location:
        lat: 'venue/location/geo:point/geo:lat'
        long: 'venue/location/geo:point/geo:long'
  ]

  limit: 10

  search: (artist, callback) =>
    @setParams("artist.getpastevents", { artist: artist, limit: @limit })
    @fetch
      success: callback
