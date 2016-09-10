var ObjectId, Reservations, models;

models = require('../models/models');

Reservations = require('../models/models').Reservations;

ObjectId = require('mongoose').Types.ObjectId;

module.exports = function(req, res, next) {
  return Reservations.findById(req.params.id).then(function(reservation) {
    if (reservation == null) {
      res.status(404);
      res.send('reservation not found');
    } else {
      if (reservation.username.toLowerCase() !== req.reservation.username.toLowerCase()) {
        res.status(401);
        return res.send('invalid access');
      } else {
        return next();
      }
    }
  });
};
