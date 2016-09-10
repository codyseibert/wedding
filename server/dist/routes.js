var ReservationsCtrl, app, isAdmin, isValidReservation, ownsReservation;

app = require('./app');

ReservationsCtrl = require('./controllers/reservations_controller');

isValidReservation = require('./helpers/is_valid_reservation');

isAdmin = require('./helpers/is_admin');

ownsReservation = require('./helpers/owns_reservation');

module.exports = (function() {
  app.get('/reservations', isAdmin, ReservationsCtrl.index);
  app.get('/reservations/:id', isValidReservation, ownsReservation, ReservationsCtrl.show);
  app.put('/reservations/:id', isValidReservation, ownsReservation, ReservationsCtrl.put);
  app.post('/reservations', isAdmin, ReservationsCtrl.post);
  return app.post('/login', isValidReservation, function(req, res) {
    res.status(200);
    return res.send(req.reservation);
  });
})();
