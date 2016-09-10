models = require '../models/models'
Reservations = require('../models/models').Reservations
ObjectId = require('mongoose').Types.ObjectId

module.exports = (req, res, next) ->
  Reservations.findById(req.params.id)
    .then (reservation) ->
      if not reservation?
        res.status 404
        res.send 'reservation not found'
        return
      else
        if reservation.username isnt req.reservation.username
          res.status 401
          res.send 'invalid access'
        else
          next()
