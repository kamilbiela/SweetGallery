mongoose = require 'mongoose'

# schema
GallerySchema = mongoose.Schema
    name:  String
    
Gallery = mongoose.model 'Gallery', GallerySchema

module.exports = Gallery