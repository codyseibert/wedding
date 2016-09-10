var Base64, Reservations, TOKEN_PASSWORD;

Base64 = require('js-base64').Base64;

Reservations = require('../models/models').Reservations;

TOKEN_PASSWORD = process.env.JWT_PASSWORD;

module.exports = function(req, res, next) {
  var auth, err, error, password, ref, username;
  auth = req.headers.authorization;
  try {
    ref = auth.split(' '), username = ref[0], password = ref[1];
    if (username === "admin" && password === process.env.PASSWORD) {
      return next();
    } else {
      res.status(401);
      return res.send('invalid access');
    }
  } catch (error) {
    err = error;
    res.status(400);
    return res.send('missing authorization header');
  }
};
