require 'coffee-script'
require './app/db'
server = require './app/server'

require './app/route/galleries'

server.listen 12345, ->
    console.log('%s listening at %s', server.name, server.url)
