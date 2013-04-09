global.uploadDir = "#{__dirname}/public/uploads"
require 'coffee-script'

fs = require 'fs'

# set up: restify
server = require './app/restifyServer'

# set up: model
path = __dirname + '/app/model'
fs.readdirSync(path).forEach (file) ->
	require path + '/' + file

# set up: routes
path = __dirname + '/app/route'
fs.readdirSync(path).forEach (file) ->
	require path + '/' + file

# set up: mongoose
mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/sweetgallery'

db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.once 'open', ->
    console.log 'Database opened'

# set up: server
server.listen 12345, ->
    console.log('%s listening at %s', server.name, server.url)
