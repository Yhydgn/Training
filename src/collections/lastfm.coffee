class Mashup.Collection.LastFm extends Backbone.Collection

  url: "http://ws.audioscrobbler.com/2.0/?"

  defaultParams:
    api_key: "LASTFM_KEY"

  setParams: (apiMethod, params = {}) ->
    @params = _.extend @defaultParams, params, method: apiMethod

  sync: (method, model, options) ->
    params = _.extend options,
      type: 'GET'
      dataType: 'xml'
      url: @url
      data: @params

    $.ajax params

  parse: (resp) ->
    Jath.parse @responsePattern, resp
