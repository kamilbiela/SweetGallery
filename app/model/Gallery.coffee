mongoose = require 'mongoose'

GallerySchema = mongoose.Schema
    name:  String
    images: [require './Image']

Gallery = mongoose.model 'Gallery', GallerySchema

module.exports = GallerySchema