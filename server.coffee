restify = require('restify')

# database
mongoose = require('mongoose')
mongoose.connect('mongodb://localhost/sweetgallery')

db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.once 'open', ->
    console.log 'Database opened'

# schema
GallerySchema = mongoose.Schema
    name:  String
    
Gallery = mongoose.model 'Gallery', GallerySchema

# restify
server = restify.createServer()
server.use(restify.bodyParser())

server.get '/galleries', (req, res, next) ->
    Gallery.find (err, galleries) ->
        next(err) if err        
        res.send galleries    
        next()

server.get '/galleries/:id', (req, res, next) ->
    Gallery.findById(req.params.id, (err, gallery) ->
        next(err) if err
        res.send gallery if gallery

        next()
    )

server.post '/galleries', (req, res, next) ->
    gallery = new Gallery(req.params)
    gallery.save (err) ->
        next(err) if err
        res.send gallery
        next()
    
server.listen 8080, ->
    console.log('%s listening at %s', server.name, server.url)
