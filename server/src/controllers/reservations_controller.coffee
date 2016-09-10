models = require '../models/models'
Reservations = models.Reservations
ObjectId = require('mongoose').Types.ObjectId
lodash = require 'lodash'

module.exports = do ->

  index: (req, res) ->
    Reservations.find().then (reservations) ->
      res.status 200
      res.send reservations

  show: (req, res) ->
    Reservations.find(username: req.username).then (reservation) ->
      if not reservation?
        res.status 404
        res.send 'user not found'
      else
        res.status 200
        res.send reservation

  put: (req, res) ->
    id = new ObjectId(req.params.id)
    Reservations.update(_id: id, req.body).then (reservation) ->
      res.status 200
      res.send reservation

  post: (req, res) ->
    Reservations.create(req.body).then (reservation) ->
      res.status 200
      res.send reservation
