var Reservations, models, mongoose;

mongoose = require('mongoose');

Reservations = require('./reservations');

models = {
  Reservations: mongoose.model('Reservations', Reservations)
};

module.exports = models;
