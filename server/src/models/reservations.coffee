mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

module.exports = new Schema
  username: String
  password: String
  party: Array
