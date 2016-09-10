var ObjectId, Reservations, lodash, models;

models = require('../models/models');

Reservations = models.Reservations;

ObjectId = require('mongoose').Types.ObjectId;

lodash = require('lodash');

module.exports = (function() {
  return {
    index: function(req, res) {
      return Reservations.find().then(function(reservations) {
        res.status(200);
        return res.send(reservations);
      });
    },
    show: function(req, res) {
      return Reservations.find({
        username: req.username
      }).then(function(reservation) {
        if (reservation == null) {
          res.status(404);
          return res.send('user not found');
        } else {
          res.status(200);
          return res.send(reservation);
        }
      });
    },
    put: function(req, res) {
      var id;
      id = new ObjectId(req.params.id);
      return Reservations.update({
        _id: id
      }, req.body).then(function(reservation) {
        res.status(200);
        return res.send(reservation);
      });
    },
    post: function(req, res) {
      return Reservations.create(req.body).then(function(reservation) {
        res.status(200);
        return res.send(reservation);
      });
    }
  };
})();
