Base64 = require('js-base64').Base64
Reservations = require('../models/models').Reservations

TOKEN_PASSWORD = process.env.JWT_PASSWORD

module.exports = (req, res, next) ->
  auth = req.headers.authorization
  try
    [username, password] = auth.split(' ')
    if username is "admin" and password is process.env.PASSWORD
      next()
    else
      res.status 401
      res.send 'invalid access'
  catch err
    res.status 400
    res.send 'missing authorization header'
