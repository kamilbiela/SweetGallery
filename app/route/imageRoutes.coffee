restify = require 'restify'
mongoose = require 'mongoose'
fs = require 'fs'
uuid = require 'node-uuid'
mime = require 'mime'

server = require '../restifyServer'
Image = mongoose.model 'Image'

server.get '/images', (req, res, next) ->
    Image.find (err, images) ->
        next(err) if err
        res.send images
        next()


server.get '/images/:_id', (req, res, next) ->
    Image.findById req.params._id, (err, image) ->
        next(err) if err
        res.send image if image
        next()


server.post '/images', (req, res, next) ->
    if req.files.imageFile.size == 0
        return next new restify.InvalidContentError("No file")

    image = new Image(req.params)
    fs.readFile req.files.imageFile.path, (err, data) ->
        next(err) if err
        name = uuid.v4()
        ext = mime.extension(req.files.imageFile.type)
        filename = "#{name}.#{ext}"
        fs.writeFile "#{global.uploadDir}/images/#{filename}", data, (err) ->
            throw err if err
            image.filename = filename
            image.save (err) ->
                next err if err
                res.send image
                next()


server.post '/images/:_id', (req, res, next) ->
    Image.findById req.params._id, (err, image) ->
        next err if err
        image.name = req.params.name
        image.save (err) ->
            next err if err
            res.send image
            next()


server.del '/images/:_id', (req, res, next) ->  
    Image.findById req.params._id, (err, image) ->
        next err if err
        image.remove (err, image) ->
            next err if err
            res.send image

