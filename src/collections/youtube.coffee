class Mashup.Collection.YouTube extends Backbone.Collection

  url: 'https://gdata.youtube.com/feeds/api/videos/'

  defaultParams:
    key: 'YOUTUBE_KEY'
    alt: 'jsonc'
    v: 2

  setParams: (apiMethod, params = {}) ->
    @params = _.extend @defaultParams, params

  sync: (method, model, options) ->
    params = _.extend {
      type: 'GET'
      dataType: 'json'
      url: @url
      data: @params
    }, options

    $.ajax(params)

  parse: (resp) -> resp.data.items
