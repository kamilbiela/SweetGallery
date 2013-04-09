mongoose = require 'mongoose'

ImageSchema = mongoose.Schema
    name:  String
	filename: String

Image = mongoose.model 'Image', ImageSchema

module.exports = ImageSchema