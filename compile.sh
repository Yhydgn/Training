#!/bin/bash
//New line
coffee -cj js/app.js \
  src/util.coffee \
  src/models/ \
  src/collections/youtube.coffee \
  src/collections/lastfm.coffee \
  src/collections/videos.coffee \
  src/collections/events.coffee \
  src/collections/artists.coffee \
  src/views/map.coffee \
  src/views/search.coffee \
  src/application.coffee \
  src/bootstrap.coffee

find js/app.js -type f -print0 | xargs -0 sed -i "s/LASTFM_KEY/$LASTFM_KEY/g"
find js/app.js -type f -print0 | xargs -0 sed -i "s/YOUTUBE_KEY/$YOUTUBE_KEY/g"

h5bp min
h5bp concat
h5bp css
