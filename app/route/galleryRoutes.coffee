mongoose = require 'mongoose'
server = require '../restifyServer'

Image = mongoose.model 'Image'
Gallery = mongoose.model 'Gallery'


server.get '/galleries', (req, res, next) ->
    q = Gallery.find()
        .where('images').slice(1)

    q.exec (err, galleries) ->
        next(err) if err        
        res.send galleries
        next()


server.get '/galleries/:_id', (req, res, next) ->
    Gallery.findById req.params._id, (err, gallery) ->
        next(err) if err
        res.send gallery if gallery
        next()


server.post '/galleries', (req, res, next) ->
    gallery = new Gallery()
    gallery.name = req.params.name

    gallery.save (err) ->
        next(err) if err
        res.send gallery
        next()


server.post '/galleries/:_id', (req, res, next) ->        
    Gallery.findById req.params._id, (err, gallery) ->
        next err if err
        gallery.name = req.params.name

        image = new Image()
        image.name = Math.random()
        gallery.push image

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
