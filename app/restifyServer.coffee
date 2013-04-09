restify = require 'restify'

server = restify.createServer()
server.use(restify.bodyParser())

module.exports = server