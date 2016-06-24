class Mashup.Collection.Artists extends Mashup.Collection.LastFm

  model: Mashup.Model.Artist

  responsePattern: ['//artist', name: 'name', url: 'url']

  limit: 5

  search: (artist, processResult) =>
    @setParams 'artist.search', artist: artist, limit: @limit
    @fetch
      success: processResult

  autocomplete: (request, respond) =>
    @search request.term, (artists) ->
      respond $.map artists.toJSON(), (artist) ->
        label: artist.name
        value: artist.name
