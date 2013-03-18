restify = require('restify')

server = restify.createServer()
server.get '/', (req, res, next) ->

    galleries = ({name: "name123" + i} for i in [1..10])
    res.send galleries    
    next()
    
server.listen 8080, ->
  console.log('%s listening at %s', server.name, server.url)
