Reservations = require('../models/models').Reservations

module.exports = (req, res, next) ->
  auth = req.headers.authorization
  try
    [username, password] = auth.split(' ')
    Reservations.findOne(username: username.toLowerCase())
      .then (reservation) ->
        if not reservation?
          res.status 404
          res.send 'reservation not found'
          return
        else
          if reservation.password isnt password
            res.status 401
            res.send 'invalid password'
          else
            req.reservation = reservation
            next()
  catch err
    res.status 400
    res.send 'missing authorization header'
