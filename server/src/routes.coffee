app = require './app'
ReservationsCtrl = require './controllers/reservations_controller'

isValidReservation = require './helpers/is_valid_reservation'
isAdmin = require './helpers/is_admin'
ownsReservation = require './helpers/owns_reservation'

module.exports = do ->
  app.get '/reservations', isAdmin, ReservationsCtrl.index
  app.get '/reservations/:id', isValidReservation, ownsReservation, ReservationsCtrl.show
  app.put '/reservations/:id', isValidReservation, ownsReservation, ReservationsCtrl.put
  app.post '/reservations', isAdmin, ReservationsCtrl.post

  app.post '/login', isValidReservation, (req, res) ->
    res.status 200
    res.send req.reservation
