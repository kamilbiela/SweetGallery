server = require '../server'
Gallery = require '../schema/GallerySchema'

server.get '/galleries', (req, res, next) ->
    Gallery.find (err, galleries) ->
        next(err) if err        
        res.send galleries    
        next()


server.get '/galleries/:_id', (req, res, next) ->
    Gallery.findById req.params._id, (err, gallery) ->
        next(err) if err
        res.send gallery if gallery
        next()


server.post '/galleries', (req, res, next) ->
    gallery = new Gallery(req.params)
    gallery.save (err) ->
        next(err) if err
        res.send gallery
        next()
            
            
server.post '/galleries/:_id', (req, res, next) ->        
    Gallery.findById req.params._id, (err, gallery) ->
        next err if err
        gallery.name = req.params.name
        gallery.save (err) ->
            next err if err
            res.send gallery
            next()


server.del '/galleries/:_id', (req, res, next) ->  
    Gallery.findById req.params._id, (err, gallery) ->
        next err if err
        gallery.remove (err, gallery) ->
            next err if err
            res.send gallery
    