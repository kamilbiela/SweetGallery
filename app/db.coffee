mongoose = require 'mongoose'

mongoose.connect('mongodb://localhost/sweetgallery')

db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.once 'open', ->
    console.log 'Database opened'
    
module.exports = db