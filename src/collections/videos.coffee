class Mashup.Collection.Videos extends Mashup.Collection.YouTube

  model: Mashup.Model.Video

  search: (query, callback) =>
    @setParams('videos', { q: query, 'max-results': 1 })
    @fetch
      success: callback
