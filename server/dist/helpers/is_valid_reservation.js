var Reservations;

Reservations = require('../models/models').Reservations;

module.exports = function(req, res, next) {
  var auth, err, error, password, ref, username;
  auth = req.headers.authorization;
  try {
    ref = auth.split(' '), username = ref[0], password = ref[1];
    return Reservations.findOne({
      username: username
    }).then(function(reservation) {
      if (reservation == null) {
        res.status(404);
        res.send('reservation not found');
      } else {
        if (reservation.password !== password) {
          res.status(401);
          return res.send('invalid password');
        } else {
          req.reservation = reservation;
          return next();
        }
      }
    });
  } catch (error) {
    err = error;
    res.status(400);
    return res.send('missing authorization header');
  }
};
